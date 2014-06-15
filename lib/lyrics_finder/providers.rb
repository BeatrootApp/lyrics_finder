require 'contracts'
include Contracts
require_relative 'providers/lyrics_wikia'

module LyricsFinder::Providers
  Contract Symbol => Module
  def build_klass(provider)
    klass = "LyricsFinder::Providers::" + provider.to_s.camelize
    klass.constantize
  end
  module_function :build_klass
end