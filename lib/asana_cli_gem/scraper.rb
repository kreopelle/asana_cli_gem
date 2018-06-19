require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  poses = Nokogiri::HTML(open('https://www.yogajournal.com/poses/types/strength'))

  binding.pry

  def pose_name_collector
    poses.css('.m-card--header').collect do |pose|
      pose.css('h2').text
    end
  end

end