require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext'
require 'i18n'
I18n.enforce_available_locales = false

require_relative 'version'
require_relative 'song'
require_relative 'providers'
