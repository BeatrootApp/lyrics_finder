require 'thor'
require 'lyrics_finder'

module Lyrics
  class CLI < Thor
    desc 'search -a Author -t Song Title', 'Search the lyrics for the specified author and title'
    method_option 'author', :aliases => '-a', :type => :string
    method_option 'title', :aliases => '-t', :type => :string
    def search
      result = LyricsFinder.search(options[:author], options[:title])
      puts result.nil? ? "Song not found." : result
    end
  end
end