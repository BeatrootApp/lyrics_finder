module LyricsFinder
  module Providers
    def self.list
      [LyricsWikia, LyricsMania, SongLyrics, Azlyrics]
    end

    def self.provider_url_for_song(provider, song)
      @current_provider = provider.new(song)
      @current_provider.format_url
    end

    def self.extract_lyric_from_data(data)
      html = Nokogiri::HTML(data)
      lyrics_container = html.css(@current_provider.css_element).first
      unless lyrics_container.nil?
        elements = lyrics_container.children.to_a
        phrases = elements.select { |el| el.text? && el.text != "\n" && !el.blank? }
        phrases.map! { |element| element.text.strip }
      end
    end

    # Providers Structs

    LyricsWikia = Struct.new(:song) do
      def format_url
        song.format_attributes_with_separator!("_")
        "http://lyrics.wikia.com/#{song.author}:#{song.title}"
      end
      def css_element; ".lyricbox"; end
    end

    LyricsMania = Struct.new(:song) do
      def format_url
        song.format_attributes_with_separator!("_")
        "http://www.lyricsmania.com/#{song.title}_lyrics_#{song.author}.html"
      end
      def css_element; ".lyrics-body"; end
    end

    SongLyrics = Struct.new(:song) do
      def format_url
        song.format_attributes_with_separator!("-")
        "http://www.songlyrics.com/#{song.author}/#{song.title}-lyrics/"
      end
      def css_element; "#songLyricsDiv"; end
    end

    Azlyrics = Struct.new(:song) do
      def format_url
        song.format_attributes_with_separator!("")
        "http://www.azlyrics.com/lyrics/#{song.author}/#{song.title}.html"
      end
      def css_element; "div:nth-child(7)"; end
    end
  end
 end
