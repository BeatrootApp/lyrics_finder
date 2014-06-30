require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext'
require 'i18n'
I18n.enforce_available_locales = false
require 'contracts'

require_relative 'version'
require_relative 'providers'
require_relative 'providers/lyrics_wikia'
require_relative 'providers/azlyrics'
require_relative 'providers/song_lyrics'
require_relative 'providers/lyrics_mania'