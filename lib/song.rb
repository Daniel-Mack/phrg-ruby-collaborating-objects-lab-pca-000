class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    artist_name = file_name.split(" ").slice(0..1).join(" ")
    artist = Artist.find_or_create_by_name(artist_name)

    song_name = file_name.split(" ").slice(3..5).join(" ")

    song = self.new(name)
    song.artist = artist
    artist.add_song(song)
    song.name = song_name
    song
  end
end


