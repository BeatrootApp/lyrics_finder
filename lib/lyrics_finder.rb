require_relative 'lyrics_finder/dependencies'

module Lyrics
  class Finder
    include Contracts
    PROVIDERS_LIST = [:lyrics_wikia, :song_lyrics, :azlyrics]

    def initialize(*args)
      @providers = filter_providers(args)
    end

    def selected_providers
      @providers
    end

    def search(author, title)
      song = Song.new(author, title)
      perform_search(song)
    end

    Contract Lyrics::Song => Or[Array, nil]
    def perform_search(song)
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

    def filter_providers(providers)
      valid_providers = []
      providers.each do |provider|
        valid_providers << provider if PROVIDERS_LIST.include?(provider)
      end
      valid_providers.any? ? valid_providers : PROVIDERS_LIST
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