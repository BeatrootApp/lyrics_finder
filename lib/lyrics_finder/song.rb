class Song
  attr_accessor :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def format_attributes_with_separator!(separator)
    self.author = I18n.transliterate(@author.strip.gsub(" ", separator))
    self.title = I18n.transliterate(@title.strip.gsub(" ", separator))
  end
end