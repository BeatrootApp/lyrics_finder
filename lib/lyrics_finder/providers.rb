require 'providers/lyrics_wikia'

module Providers
  PROVIDERS_LIST = Set.new [:lyrics_wikia]

  def self.valid_providers(providers)
    if providers.is_a?(Set)
      providers if providers.subset?(PROVIDERS_LIST)
    end
  end
end