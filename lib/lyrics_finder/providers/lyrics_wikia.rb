class LyricsFinder::Providers::LyricsWikia
  class << self
    def format_url(author, title)
      author = format_parameter(author)
      title = format_parameter(title)
      "http://lyrics.wikia.com/#{author}:#{title}"
    end

    def extract_lyric(data)

    end
  end

  private

  def format_parameter(param)
    I18n.transliterate(param.strip.gsub(" ", "_"))
  end
end