require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
#attr_accessor :name, :location, :profile_url, :index_url

#@@all = []

  def self.scrape_index_page(index_url)
    student_site = Nokogiri::HTML(open(index_url))

    students = []

    student_site.css(".student-card").each do |student|
    name = student.css(".student-name").text
    location = student.css(".student-location").text
    profile_url = student.css("a").attribute("href").value
      #binding.pry
      students << {
        name: name,
        location: location,
        profile_url: profile_url
      }
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    student_profile = Nokogiri::HTML(open(profile_url))
    student_links = {}

    social_media_links = student_profile.css(".social-icon-container a").each do |sm_links|
    sm_links = a['href']
      binding.pry
    end
  end

end
