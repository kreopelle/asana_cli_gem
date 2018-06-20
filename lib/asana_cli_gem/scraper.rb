require 'open-uri'

class AsanaCliGem::Scraper

  @@site = Nokogiri::HTML(open('https://www.yogajournal.com/poses/types/strength'))

  def self.site
    @@site
  end

  def self.pose_url_collector
    self.site.css('#lyra-wrapper > div.m-page-wrapper > div.m-advertisement-off-canvas--pusher > section > div.m-page > section.m-tile-hub.m-component-stack.mm-component-stack--is-stacked')
    .css('a.m-card--header').collect do |pose|
      pose.attribute("href").value
    end
  end

  def self.asana_generator
    pose_url_collector.each do |pose|
      url = "https://www.yogajournal.com#{pose}"
      pose_scraper = Nokogiri::HTML(open(url))
      name = pose_scraper.css('h1').text
      summary = pose_scraper.css('div.m-detail-header--dek').text
      new_pose = AsanaCliGem::Asana.new(name, summary, url)
      extra_attributes = {}
      pose_scraper.css('div.m-detail--body h3').each do |attribute|
        extra_attributes[attribute.text] = attribute.css('+p').text
      end
      # Potential expansion issue: Current iterator doesn't grab ul's
      new_pose.sanskrit = extra_attributes["Sanskrit Name"]
      new_pose.tip = extra_attributes["Beginner's Tip"]
      new_pose.save
    end
  end
    binding.pry

end
