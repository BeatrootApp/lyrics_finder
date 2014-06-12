module LyricsFinder::Providers
  module LyricsWikia
    def format_url(author, title)
      author = I18n.transliterate(author.strip.gsub(" ", "_"))
      title = I18n.transliterate(title.strip.gsub(" ", "_"))
      "http://lyrics.wikia.com/#{author}:#{title}"
    end

    def extract_lyric(data)
      html = Nokogiri::HTML(data)
      lyrics_container = html.css('.lyricbox').first
      elements = lyrics_container.children.to_a
      phrases = elements.select { |el| el.text? && el.text != "\n" }
      phrases.map! { |element| element.text.strip }
    end

    module_function :format_url, :extract_lyric
  end
end