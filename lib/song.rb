class Song
  attr_accessor :name, :artist_name
  @@all = []


  def initialize(name=nil)
    @name = name
  end


  def self.all
    @@all
  end


  def save
    self.class.all << self
    self
  end


  def self.create
    song = self.new
    song.save
  end


  def self.new_by_name(name)
    song = self.new(name)
    song
  end


  def self.create_by_name(name)
    song = self.new(name).save
    song
  end


  def self.find_by_name(name)
    self.all.find {|element| element.name == name}
  end


  def self.find_or_create_by_name(name)
    unless @@all.include?(name)
      song = self.new(name)
    end
  end


  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end


  def self.new_from_filename(file)
    file_artist = (file.split(" - ")[0].gsub(".mp3" , ""))
    file_name = (file.split(" - ")[1].gsub(".mp3" , ""))
    song = self.new
    song.name = file_name
    song.artist_name = file_artist
    song
  end


  def self.create_from_filename(file)
    file_artist = (file.split(" - ")[0].gsub(".mp3" , ""))
    file_name = (file.split(" - ")[1].gsub(".mp3" , ""))
    song = self.new.save
    song.name = file_name
    song.artist_name = file_artist
    song
  end


  def self.destroy_all
    @@all.clear
  end

end
