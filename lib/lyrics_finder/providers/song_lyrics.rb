module Providers::SongLyrics
  include Contracts

  Contract Song => String
  def self.format_url(song)
    song.format_attributes_with_separator!("-")
    "http://www.songlyrics.com/#{song.author}/#{song.title}-lyrics/"
  end

  Contract Tempfile => Or[Array, nil]
  def self.extract_lyric(data)
    Providers.extract_lyrics_at_css_from_data('#songLyricsDiv', data)
  end
end