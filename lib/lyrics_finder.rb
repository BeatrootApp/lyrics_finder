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
    if validate_song_data(args)
      filter_providers(args).each do |provider|
        klass = build_klass(provider)
        p "KLASS: #{klass}"

        url = klass.format_url(args.fetch(:author), args.fetch(:title))
        p "URL: #{url}"

        data = perform_request(url)

        return klass.extract_lyric(data) if data
      end
    else
      puts "Not a valid author or title"
    end
  end

  private

  # checks the author and title params aren't false, empty or whitespace
  def validate_song_data(args)
    !args.fetch(:author).blank? && !args.fetch(:title).blank?
  end

  # if providers are given and are valid, returns them
  # if no providers are given or they aren't valid, returns PROVIDERS_LIST
  def filter_providers(args)
    providers = args.fetch(:providers, nil)
    return providers if LyricsFinder::Providers.valid_providers?(providers)
    LyricsFinder::Providers::PROVIDERS_LIST
  end

  def build_klass(provider)
    klass = "LyricsFinder::Providers::" + provider.to_s.camelize
    klass.constantize
  end

  def perform_request(url)
    begin
      open(url)
    rescue URI::InvalidURIError
      puts "#{url} it's not a valid URL"
      nil
    rescue OpenURI::HTTPError
      puts "No results found for this terms"
      nil
    end
  end
end