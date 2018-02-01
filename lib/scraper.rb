require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './podcast.rb'

class Scraper

  def get_page

    doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))

    # doc.css(".post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css("p").text
    #   end
    #   binding.pry
    end

    def get_podcasts
      self.get_page.css(".allTopPodcasts")
    end

    def make_podcasts
      self.get_podcasts.each do |post|
        podcast = Podcast.new
        podcast.position = pod.css(".numberImage").text.gsub(/\t/, '').strip
        podcast.summary = pod.css("p").text.strip
      end
    end

    def print_podcasts
      self.make_podcasts
      Podcast.all.each do |podcast|
        if podcast.name
          puts "Name: #{podcast.name}"  "Position: #{podcast.position}"
        end
      end
    end
  end

  Scraper.new.print_podcasts
