class Song
  attr_accessor :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def self.valid?(val)
    val.is_a?(Song) && !val.author.blank? && !val.title.blank?
  end

  # Fixme
  def self.to_s
    "a valid author and song title please"
  end

  def format_attributes_with_separator!(separator)
    self.author = I18n.transliterate(@author.strip.gsub(" ", separator))
    self.title = I18n.transliterate(@title.strip.gsub(" ", separator))
  end
end