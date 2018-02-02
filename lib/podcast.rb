

class Podcast

    attr_accessor :name, :position, :summary, :producer, :url

    @@all = []

    def initialize(name=nil, url=nil, producer=nil, position=nil)
        @name = name
        @url = url
        @producer = producer
        @position = position
        @@all << self
    end

    def self.all
      @@all
    end

  def self.reset_all
    @@all.clear
  end
end
