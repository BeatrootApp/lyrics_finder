module LyricsFinder::Providers::Azlyrics
  def format_url(author, title)
    author = I18n.transliterate(author.strip.gsub(" ", ""))
    title = I18n.transliterate(title.strip.gsub(" ", ""))
    "http://www.azlyrics.com/lyrics/#{author}/#{title}.html"
  end
  module_function :format_url

  def extract_lyric(data)
    html = Nokogiri::HTML(data)
    lyrics_container = html.css('div:nth-child(7)').first
    elements = lyrics_container.children.to_a
    phrases = elements.select { |el| el.text? && el.text != "\n" && !el.blank? }
    phrases.map! { |element| element.text.strip }
  end
  module_function :extract_lyric
end