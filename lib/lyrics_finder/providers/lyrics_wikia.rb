module LyricsFinder::Providers::LyricsWikia
  #Contract lambda { |a, s| !a.blank? && !s.blank? } => String
  Contract String, String => String
  def format_url(author, title)
    author = I18n.transliterate(author.strip.gsub(" ", "_"))
    title = I18n.transliterate(title.strip.gsub(" ", "_"))
    "http://lyrics.wikia.com/#{author}:#{title}"
  end
  module_function :format_url

  #Contract lambda { |x| x.is_a? Tempfile } => Module
  Contract lambda { |x| x.is_a? Tempfile } => Array
  def extract_lyric(data)
    html = Nokogiri::HTML(data)
    lyrics_container = html.css('.lyricbox').first
    unless lyrics_container.nil?
      elements = lyrics_container.children.to_a
      phrases = elements.select { |el| el.text? && el.text != "\n" && !el.blank? }
      phrases.map! { |element| element.text.strip }
    end
  end
  module_function :extract_lyric
end