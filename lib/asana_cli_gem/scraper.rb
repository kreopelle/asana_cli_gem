require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  @@site = Nokogiri::HTML(open('https://www.yogajournal.com/poses/types/strength'))

  def self.site
    @@site
  end

  def self.pose_name_collector
  # current scrape includes non-pose articles on the page too, need to get them out
    site.css('.m-card--header').collect do |pose|
      pose.css('h2').text
    end
  end

  def self.pose_url_collector
    # current scrape includes non-pose urls on the page too, need to get them out
    site.css('a.m-card--header').collect do |pose|
      pose.attribute("href").value
    end
  end

  def self.asana_generator
    pose_url_collector.each do |pose|
      url = "https://www.yogajournal.com#{pose}"
      pose_scraper = Nokogiri::HTML(open(url))
      name = pose_scraper.css('h1').text
      summary = pose_scraper.css('div.m-detail-header--dek').text
      new_pose = Asana.new(name, summary, url)
      new_pose.save 
      #pose.sanskrit = TBD
      #pose.tip = TBD
    end
    binding.pry 
  # test = Nokogiri::HTML(open("https://www.yogajournal.com/poses/chair-pose"))
  #sample = {}
  #test.css('div.m-detail--body h3').each do |item|
  #  sample[item.text] = item.css('+p').text
  #end
  #new_pose.sanskrit = sample["Sanskrit Name"]
  #new_pose.tip = sample["Beginner's Tip"]
  # New issue: Current iterator does not grab UL's


  end

end
