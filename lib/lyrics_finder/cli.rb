require 'thor'
require 'lyrics_finder'

module Lyrics
  class CLI < Thor
    desc 'search -a Author -t Song Title', 'Search the lyrics for the specified author and title'
    method_option 'author', :aliases => '-a', :type => :string
    method_option 'title', :aliases => '-t', :type => :string
    def search
      puts LyricsFinder.search(options[:author], options[:title])
    end
  end
end