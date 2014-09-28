module LyricsFinder::Providers
  include Contracts

  def self.list
    [:lyrics_wikia, :lyrics_mania, :song_lyrics, :azlyrics]
  end

  Contract Symbol => Module
  def self.build_klass(provider)
    klass = "LyricsFinder::Providers::" + provider.to_s.camelize
    klass.constantize
  end

  Contract String, Tempfile => Or[Array, nil]
  def self.extract_lyrics_at_css_from_data(css_element, data)
    html = Nokogiri::HTML(data)
    lyrics_container = html.css(css_element).first
    unless lyrics_container.nil?
      elements = lyrics_container.children.to_a
      phrases = elements.select { |el| el.text? && el.text != "\n" && !el.blank? }
      phrases.map! { |element| element.text.strip }
    end
  end

  # Providers Modules

  module LyricsWikia
    def self.format_url(song)
      song.format_attributes_with_separator!("_")
      "http://lyrics.wikia.com/#{song.author}:#{song.title}"
    end

    def self.extract_lyric(data)
      LyricsFinder::Providers.extract_lyrics_at_css_from_data('.lyricbox', data)
    end
  end

  module LyricsMania
    def self.format_url(song)
      song.format_attributes_with_separator!("_")
      "http://www.lyricsmania.com/#{song.title}_lyrics_#{song.author}.html"
    end

    def self.extract_lyric(data)
      LyricsFinder::Providers.extract_lyrics_at_css_from_data('.lyrics-body', data)
    end
  end

  module SongLyrics
    def self.format_url(song)
      song.format_attributes_with_separator!("-")
      "http://www.songlyrics.com/#{song.author}/#{song.title}-lyrics/"
    end

    def self.extract_lyric(data)
      LyricsFinder::Providers.extract_lyrics_at_css_from_data('#songLyricsDiv', data)
    end
  end

  module Azlyrics
    def self.format_url(song)
      song.format_attributes_with_separator!("")
      "http://www.azlyrics.com/lyrics/#{song.author}/#{song.title}.html"
    end

    def self.extract_lyric(data)
      LyricsFinder::Providers.extract_lyrics_at_css_from_data('div:nth-child(7)', data)
    end
  end

end