module Providers
  module Azlyrics
    include Contracts

    def self.format_url(song)
      song.format_attributes_with_separator!("")
      "http://www.azlyrics.com/lyrics/#{song.author}/#{song.title}.html"
    end

    Contract Tempfile => Or[Array, nil]
    def self.extract_lyric(data)
      LyricsFinder::Providers.extract_lyrics_at_css_from_data('div:nth-child(7)', data)
    end
   end
end