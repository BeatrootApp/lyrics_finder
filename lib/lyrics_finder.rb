require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext'
require 'i18n'
require 'lyrics_finder/version'
require 'lyrics_finder/providers'

module LyricsFinder

  module_function

  def search(args)
    providers = filter_providers(args)
    if validate_song_data(args)
      providers.each do |provider|
        klass = "LyricsFinder::Providers::" + provider.to_s.camelize
        klass = klass.constantize

        puts "KLASS: #{klass}"

        klass.format_url(args.fetch(:author), args.fetch(:title))

        # DO REQUEST HERE

        # klass.extract_lyric(data)
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
    LyricsFinder::Providers.valid_providers?(args.fetch(:providers, nil)) ||
        LyricsFinder::Providers::PROVIDERS_LIST
  end
end
