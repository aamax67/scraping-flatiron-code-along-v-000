require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './podcast.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))
      binding.pry

      doc.css(".allTopPodcasts").each do |pod|
      podcast = Podcast.new
      podcast.name = pod.css("h3").text.gsub(/\t/, '').strip
      podcast.rank = pod.css(".numberImage").text.gsub(/\t/, '').strip
      podcast.summary = pod.css("p").text.strip
      podcast.url = doc.search("a.view_show").attr("href")
      end
    end
        binding.pry
  end
