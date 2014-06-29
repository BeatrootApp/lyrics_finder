module Lyrics
  module Providers::SongLyrics
    include Contracts

    Contract Lyrics::Song => String
    def self.format_url(song)
      song.format_attributes_with_separator!("-")
      "http://www.songlyrics.com/#{song.author}/#{song.title}-lyrics/"
    end

    Contract Tempfile => Or[Array, nil]
    def self.extract_lyric(data)
      Lyrics::Providers.extract_lyrics_at_css_from_data('#songLyricsDiv', data)
    end
  end
end