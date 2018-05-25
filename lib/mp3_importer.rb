class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|m| !File.directory? m}
  end

  def import
    files.each {|file_name| Song.new_by_filename(file_name)}
  end
end
