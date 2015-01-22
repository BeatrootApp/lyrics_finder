require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext'
require 'i18n'
I18n.enforce_available_locales = false
require_relative 'lyrics_finder/version'
require_relative 'lyrics_finder/song'
require_relative 'lyrics_finder/provider'

module LyricsFinder

  def self.search(author, title)
    begin
      Provider.list.each do |provider|
        url = Provider.url_for_song(provider, Song.new(author, title))
        data = open(url)
        result = Provider.extract_lyric_from_data(data) unless data.nil?
        return result unless result.nil?
      end
    rescue SocketError => ex
      puts "LyricsFinder can't connect to the internet"
    rescue OpenURI::HTTPError => ex
      puts "LyricsFinder can't find any matching lyrics for that song"
    end
  end

end