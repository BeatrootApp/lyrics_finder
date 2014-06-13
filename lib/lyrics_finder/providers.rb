require_relative 'providers/lyrics_wikia'

module LyricsFinder::Providers
  PROVIDERS_LIST = [:lyrics_wikia]

  def self.valid_providers?(providers)
    providers.all? { |provider| PROVIDERS_LIST.include?(provider) } if providers
  end
end