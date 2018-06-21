class AsanaCliGem::Scraper
  attr_accessor :url

  def initialize(url = nil)
    @url = url
  end

  def pose_collector
    doc = Nokogiri::HTML(open('https://www.yogajournal.com/poses/types/strength'))
    doc.css('#lyra-wrapper > div.m-page-wrapper > div.m-advertisement-off-canvas--pusher > section > div.m-page > section.m-tile-hub.m-component-stack.mm-component-stack--is-stacked')
       .css('a.m-card--header').collect do |pose|

         new_pose = AsanaCliGem::Asana.new
         new_pose.name = pose.css('h2').text
         new_pose.url = "https://www.yogajournal.com#{pose.attribute("href").value}"

         new_pose.save
       end
    end

  def asana_details(url)
    pose_scraper = Nokogiri::HTML(open(url))

    extra_attributes = {}
    pose_scraper.css('div.m-detail--body h3').each do |attribute|
        extra_attributes[attribute.text] = attribute.css('+p').text
    end
    updated_pose = AsanaCliGem::Asana.all.detect {|pose| pose.url == url }
    updated_pose.summary = pose_scraper.css('div.m-detail-header--dek').text
    updated_pose.sanskrit = extra_attributes["Sanskrit Name"] if extra_attributes["Sanskrit Name"]
    updated_pose.tip = extra_attributes["Beginner's Tip"] if extra_attributes["Beginner's Tip"]

  end

end
