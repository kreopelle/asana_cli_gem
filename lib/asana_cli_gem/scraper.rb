class AsanaCliGem::Scraper

  def pose_collector
    # perhaps only keep this funcitonality if you separate the list view scrape from the object?
    @doc = Nokogiri::HTML(open('https://www.yogajournal.com/poses/types/strength'))
    @doc.css('#lyra-wrapper > div.m-page-wrapper > div.m-advertisement-off-canvas--pusher > section > div.m-page > section.m-tile-hub.m-component-stack.mm-component-stack--is-stacked')
    .css('a.m-card--header').collect do |pose|
      "https://www.yogajournal.com#{pose.attribute("href").value}"
    end
  end

  def asana_generator
    pose_collector.each do |pose|
      pose_scraper = Nokogiri::HTML(open(pose))

      extra_attributes = {}
      pose_scraper.css('div.m-detail--body h3').each do |attribute|
        extra_attributes[attribute.text] = attribute.css('+p').text
      end

      new_pose = AsanaCliGem::Asana.new
      new_pose.url = pose
      new_pose.name = pose_scraper.css('h1').text
      new_pose.summary = pose_scraper.css('div.m-detail-header--dek').text
      new_pose.sanskrit = extra_attributes["Sanskrit Name"] if extra_attributes["Sanskrit Name"]
      new_pose.tip = extra_attributes["Beginner's Tip"] if extra_attributes["Beginner's Tip"]

      new_pose.save
    end
  end

end
