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
      pose = Nokogiri::HTML(open("https://www.yogajournal.com#{pose}"))
      puts pose.css('div.m-detail-header--dek').text
    end

    # pose.url => pose = Nokogiri::HTML(open("https://www.yogajournal.com#{pose}"))
    # pose.name => puts pose.css('h1').text

  end

end
