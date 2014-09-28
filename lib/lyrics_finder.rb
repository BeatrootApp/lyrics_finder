require_relative 'lyrics_finder/dependencies'

module LyricsFinder
  include Contracts

  Contract String, String => Or[Array, nil]
  def self.search(author, title)
    song = Song.new(author, title)
    song_lyric = catch(:song_lyric) {
     Providers.list.each do |provider|
        klass = Providers.build_klass(provider)
        url = klass.format_url(song)
        data = perform_request(url)
        result = klass.extract_lyric(data) if data
        throw :song_lyric, result unless result.nil?
      end
      throw :song_lyric, nil # because song cannot be found.
    }
  end

  def self.perform_request(url)
    begin
      open(url)
    rescue Exception => ex
      # puts "ERROR: " + ex.message
    end
  end

end