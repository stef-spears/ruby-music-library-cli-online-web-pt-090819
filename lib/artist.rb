require 'pry'

class Artist 
  #extend Concerns::Findable
  
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(name)
    new_artist = self.new(name).tap do |i|
      i.save
    end 
  end
  
  def songs 
    @songs 
  end 
  
  def is_duplicate?(song)
    @songs.include?(song)
  end
  
  def has_artist?(song)
    !!song.artist
  end 
  
  def add_song(song)
     song.artist = self unless !!song.artist
     @songs << song unless @songs.include?(song)
  end 
  
  def genres 
    # song is the single source of truth
    @songs.collect { |s| s.genre }.uniq
  end 
  
end 