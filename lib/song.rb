require "pry"

class Song
    attr_accessor :name, :artist_name

    @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    
   song = self.new

   @@all << song

   song

  end


  def self.new_by_name(name) #passes a name "Blank Space"

    new_song = self.new #create new instance class #<Song:0x00007ffbe923e668>

    new_song.name = name   #assigned to the new instance's variable name the name of the argument passed 

    new_song #now the new_song instance variable created has a instance variable with the name of the name we passed to

  end

  def self.create_by_name(name) #pass in a name as argument 
    
    song_create = self.new_by_name(name) #recall on the call method passing the name and assign the instance class with the name we passed to to a variable

    @@all << song_create #we store this variable in the class variable 
    
    song_create #<Song:0x00007fd36eb30418 @name="Blank Space">
  
  end

  def self.find_by_name(song)
       @@all.find do |instance| 
      
      if instance.name === song
        instance.name
      else 
        false
      end

    end

  end

  def self.find_or_create_by_name(song_name)
 
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
    
  end

  def self.alphabetical

    @@all.sort_by {|a| a.name}

  end

  def self.new_from_filename(file_name) #"Thundercat - For Love I Come.mp3"
    song = self.new
     file_name_new = file_name.split(/[\-,.]/)
     file_name_new.delete("mp3")
     file_name_new
     #binding.pry
     song.name = file_name_new[1].strip
      song.artist_name = file_name_new[0].strip
  
      song


   #binding.pry

  end

  def self.create_from_filename(file_name)
   @@all << self.new_from_filename(file_name)
   end

  def self.destroy_all
      @@all.clear
   
   end
#binding.pry
end


