module Providers
  module LyricsMania
    include Contracts

    def self.format_url(song)
      song.format_attributes_with_separator!("_")
      "http://www.lyricsmania.com/#{song.title}_lyrics_#{song.author}.html"
    end

    Contract Tempfile => Or[Array, nil]
    def self.extract_lyric(data)
      LyricsFinder::Providers.extract_lyrics_at_css_from_data('.lyrics-body', data)
    end
  end
end