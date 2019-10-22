require 'pry'

class Genre 
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
    new_genre = self.new(name).tap do |i|
      i.save
    end 
  end 
  
  def artists 
    @songs.collect {|s| s.artist }.uniq
  end 
  
  
end 