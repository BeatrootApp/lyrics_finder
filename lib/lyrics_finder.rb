require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext'
require 'i18n'
I18n.enforce_available_locales = false
require_relative 'lyrics_finder/version'
require_relative 'lyrics_finder/providers'
require 'pry'

module LyricsFinder
  extend self

  def search(args)
    providers = filter_providers(args)
    if validate_song_data(args)
      providers.each do |provider|
        klass = "LyricsFinder::Providers::" + provider.to_s.camelize
        klass = klass.constantize
        p "KLASS: #{klass}"

        url = klass.format_url(args.fetch(:author), args.fetch(:title))
        p "URL: #{url}"

        begin
          data = open(url)
        rescue URI::InvalidURIError
          p "#{url} it's not a valid URI"
        rescue OpenURI::HTTPError
          p "Nothing found"
        end

        return klass.extract_lyric(data) if data
      end
    end
    p "Not a valid author, title or provider list"
  end

  private

  # checks the author and title params to not being false, empty or whitespace
  def validate_song_data(args)
    !args.fetch(:author).blank? && !args.fetch(:title).blank?
  end

  # if providers are given checks if they are valid (if valid returns them)
  # if no providers are given returns the default PROVIDERS_LIST
  def filter_providers(args)
    providers = args.fetch(:providers, nil)
    if providers && LyricsFinder::Providers.valid_providers()

    end
    LyricsFinder::Providers.valid_providers(args.fetch(:providers, nil)) ||
        LyricsFinder::Providers::PROVIDERS_LIST
  end
end