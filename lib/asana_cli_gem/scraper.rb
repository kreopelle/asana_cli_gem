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
      pose = Asana.new
      pose.url = "https://www.yogajournal.com#{pose}"
      pose_scraper = Nokogiri::HTML(open(pose.url))
      pose.name = pose.css('h1').text
      pose.url = 
      puts pose.css('div.m-detail--body-item').text
    end
    #”lyra-wrapper"/div[2]/div[2]/section/div[2]/section[2]/article/div/div[3]/section/div[1]/div[2]/p[13]
    # /section[2]/article/div/div[3]/section/div[1]/div[2]/p[13]
    # test_pose.css('#lyra-wrapper').css('div')[2].css('div')[2].css('section').css('div')[2].css('section')[2].css('article div').css('div')[3].css('section').css('div')[1].css('div')[2].css('p')[13]
    # pose.summary => pose.css('div.m-detail-header--dek').text
    # pose.url => pose = Nokogiri::HTML(open("https://www.yogajournal.com#{pose}"))
    # pose.name => puts pose.css('h1').text
    # pose.sanskrit => pose.css('p')[13].text
    # pose.tip => pose.css('p')[16].text
    # pose_tip => test_pose.css('div.m-detail--body').css('h3').select do |tag|
      # tag.text == "Beginner's Tip"
    # end
    # sanskrit =>
    # test = Nokogiri::HTML(open("https://www.yogajournal.com/poses/chair-pose"))
    # test.css('div.m-detail--body').css('h3 + p').text if test.css('div.m-detail--body').css('h3').text == "Sanskrit Name"
    # could stop here, or, send over the name and url to the object now, and add beginner's tip and sanskrit later?
  end

end
