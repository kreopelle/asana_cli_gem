require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  @@site = Nokogiri::HTML(open('https://www.yogajournal.com/poses/types/strength'))

  # binding.pry

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
    site.css('a.m-card--header').collect do |pose|
      pose.attribute("href").value
    end
  end

end
