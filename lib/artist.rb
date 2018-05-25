require 'pry'

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create_by_name(name)
    artist = self.new(name)
    self.all << artist
    artist
  end

  def self.find_by_name(name)
    all.detect do |artist_name|
      artist_name.name == name
    end
  end


  def self.find_or_create_by_name(name)
    found_artist = find_by_name(name)
    if found_artist
      found_artist
    else
      create_by_name(name)
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
end
