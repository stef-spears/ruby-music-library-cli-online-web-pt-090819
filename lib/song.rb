require 'pry'

class Song
  
  attr_accessor :name, :artist, :genre 
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre
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
    new_song = self.new(name).tap do |i|
      i.save
    end 
  end
  
  def artist=(artist)
    #artist = Artist.new(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
   self.all.find do |n| #return first matching item
     n.name == name
      end
   end
   
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    # alt: find_by_name(name) || self.create(name)
  end 
  
  def self.new_from_filename(filename)
   #binding.pry
    song_artist = Artist.create(filename.split(" - ")[0])
    #song_name = filename.split(" - ")[1]
    new_song = self.create(filename.split(" - ")[1])
    new_song
  end 
  
end 