require_relative 'lyrics_finder/dependencies'

module LyricsFinder
  include Contracts

  Contract String, String => Or[Array, nil]
  def self.search(author, title)
    Providers.list.each do |provider|
      url = Providers.provider_url_for_song(provider, Song.new(author, title))
      data = perform_request(url)
      result = Providers.extract_lyric_from_data(data) if data
      return result unless result.nil?
    end
    return nil # because song cannot be found.
  end

  def self.perform_request(url)
    begin
      open(url)
    rescue Exception => ex
      # puts "ERROR: " + ex.message
    end
  end

end