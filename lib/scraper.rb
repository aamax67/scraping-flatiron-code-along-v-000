require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './podcast.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))
      binding.pry

      doc.css(".allTopPodcasts").each do |p|
      podcast = Podcast.new
      podcast.name = p.css("h3").text.gsub(/\t/, '').strip
      podcast.rank = p.css(".numberImage").text.gsub(/\t/, '').strip
      podcast.summary = p.css("p").text.strip
      end
    end
        binding.pry
  end
