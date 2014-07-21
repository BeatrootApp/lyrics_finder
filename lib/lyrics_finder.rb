require_relative 'lyrics_finder/dependencies'

module Lyrics
  class Finder
    include Contracts

    def initialize(*args)
      @providers = Providers.filter_providers(args)
    end

    def selected_providers
      @providers
    end

    Contract String, String => Or[Array, nil]
    def search(author, title)
      song = set_song(author, title)
      song_lyric = catch(:song_lyric) {
        @providers.each do |provider|
          klass = Providers.build_klass(provider)
          url = klass.format_url(song)
          data = perform_request(url)
          result = klass.extract_lyric(data) if data
          throw :song_lyric, result unless result.nil?
        end
        throw :song_lyric, nil # because song cannot be found.
      }
    end

    private

    Contract String, String => Lyrics::Song
    def set_song(author, title)
      Song.new(author, title)
    end

    def perform_request(url)
      begin
        open(url)
      rescue Exception => ex
        # puts "ERROR: " + ex.message
      end
    end
  end
end