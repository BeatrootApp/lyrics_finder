module Providers
  module LyricsWikia
    include Contracts

    def self.format_url(song)
      song.format_attributes_with_separator!("_")
      "http://lyrics.wikia.com/#{song.author}:#{song.title}"
    end

    Contract Tempfile => Or[Array, nil]
    def self.extract_lyric(data)
      LyricsFinder::Providers.extract_lyrics_at_css_from_data('.lyricbox', data)
    end
  end
end