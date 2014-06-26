module LyricsFinder::Providers::LyricsMania
  def format_url(author, title)
    author = I18n.transliterate(author.strip.gsub(" ", "_"))
    title = I18n.transliterate(title.strip.gsub(" ", "_"))
    "http://www.lyricsmania.com/#{title}_lyrics_#{author}.html"
  end
  module_function :format_url

  def extract_lyric(data)
    html = Nokogiri::HTML(data)
    lyrics_container = html.css('.lyrics-body').first
    elements = lyrics_container.children.to_a
    phrases = elements.select { |el| el.text? && el.text != "\n" && !el.blank? }
    phrases.map! { |element| element.text.strip }
  end
  module_function :extract_lyric
end