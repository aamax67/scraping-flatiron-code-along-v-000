require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './podcast.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))
    end
    
    def get_podcasts
          self.get_page.css(".podcastRow")
    end

    def make_podcasts
      doc.css(".podcastRow").each do |podcastRow|
      podcast = Podcast.new
      podcast.name = podcastRow.css("h3").text.gsub(/\t/, '').strip
      podcast.rank = podcastRow.css(".numberImage").text.gsub(/\t/, '').strip
      podcast.summary = podcastRow.css("p").text.strip
      end
    end

    def print_podcasts
      self.make_podcasts
      Podcast.all.each do |podcast|
        if podcast.name
          puts "#{podcast.position} #{podcast.name}"
        end
      end
    end
  end
