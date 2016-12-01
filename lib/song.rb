class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


  def self.create
    self.new.save
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
    self.all.find{|element| element.name == name}
  end


  def initialize(name=nil)
    @name = name
  end


  def save
    self.class.all << self
    self
  end

end
