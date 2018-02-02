

class Podcast

    attr_accessor :name, :position, :summary

      @@all = []

    def initialize
      @@all
    end

    def self.all
      @@all << self
    end

  def self.reset_all
    @@all.clear
  end
end
