module Lyrics
  module Providers::LyricsMania
    include Contracts

    Contract Lyrics::Song => String
    def self.format_url(song)
      song.format_attributes_with_separator!("_")
      "http://www.lyricsmania.com/#{song.title}_lyrics_#{song.author}.html"
    end

    Contract Tempfile => Or[Array, nil]
    def self.extract_lyric(data)
      Lyrics::Providers.extract_lyrics_at_css_from_data('.lyrics-body', data)
    end
  end
end