require_relative 'song'

module Lyrics
  module Providers
    include Contracts

    Contract Symbol => Module
    def self.build_klass(provider)
      klass = "Lyrics::Providers::" + provider.to_s.camelize
      klass.constantize
    end

    def self.extract_lyrics_at_css_from_data(css_element, data)
      html = Nokogiri::HTML(data)
      lyrics_container = html.css(css_element).first
      unless lyrics_container.nil?
        elements = lyrics_container.children.to_a
        phrases = elements.select { |el| el.text? && el.text != "\n" && !el.blank? }
        phrases.map! { |element| element.text.strip }
      end
    end
  end
end