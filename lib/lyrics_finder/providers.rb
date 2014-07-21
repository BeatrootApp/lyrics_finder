require_relative 'song'

module Lyrics
  module Providers
    include Contracts

    def self.providers_list
      [:lyrics_wikia, :lyrics_mania, :song_lyrics, :azlyrics]
    end

    def self.filter_providers(providers)
      valid_providers = providers.select { |p| providers_list.include?(p) }
      valid_providers.any? ? valid_providers : providers_list
    end

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