require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext'
require 'i18n'
I18n.enforce_available_locales = false
require_relative 'lyrics_finder/version'
require_relative 'lyrics_finder/song'
require_relative 'lyrics_finder/providers'


module LyricsFinder
  def self.search(author, title)
    Providers.list.each do |provider|
      url = Providers.provider_url_for_song(provider, Song.new(author, title))
      data = perform_request(url)
      result = Providers.extract_lyric_from_data(data) unless data.nil?
      return result unless result.nil?
    end
    return nil # song not found
  end

  private

    def self.perform_request(url)
      begin
        open(url)
      rescue Exception => ex
        # puts "ERROR: " + ex.message
      end
    end
end