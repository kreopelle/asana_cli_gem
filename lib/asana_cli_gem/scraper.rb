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
  binding.pry

  def self.asana_generator
    self.pose_url_collector.each do |pose|
      url = "https://www.yogajournal.com#{pose}"
      pose_scraper = Nokogiri::HTML(open(url))
      name = pose_scraper.css('h1').text
      summary = pose_scraper.css('div.m-detail-header--dek').text
      new_pose = Asana.new(name, summary, url)
      new_pose.save 
      #pose.sanskrit = TBD
      #pose.tip = TBD
    end

    # pose.sanskrit => pose.css('p')[13].text
    # pose.tip => pose.css('p')[16].text
    # pose_tip => test_pose.css('div.m-detail--body').css('h3').select do |tag|
      # tag.text == "Beginner's Tip"
    # end
    # test = Nokogiri::HTML(open("https://www.yogajournal.com/poses/chair-pose"))
    # test.css('div.m-detail--body').css('h3 + p').text if test.css('div.m-detail--body').css('h3').text == "Sanskrit Name"
    # could stop here, or, send over the name and url to the object now, and add beginner's tip and sanskrit later?
    # YAYYYYY!!!!!! only issue is that it does not grab ul's, so need to perhaps include some conditional statements? 
    # New issues: Deleting the additional poses at the end of a page, Grabbing the UL's

  sample = {}
  test.css('div.m-detail--body h3').each do |item|
    sample[item.text] = item.css('+p').text
  end

  sample = {}
  test.css('div.m-detail--body h3').each do |item|
    sample[item.text] = item.css('+p').text
  end

  end

end
