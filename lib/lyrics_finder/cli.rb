require 'thor'
require 'lyrics_finder'

module LyricsFinder
  class CLI < Thor
    desc 'search -a "author" -t "song"', 'Search the lyrics for the specified author and song'
    method_option 'author', :aliases => '-a', :type => :string
    method_option 'title', :aliases => '-t', :type => :string
    def search
      puts LyricsFinder.search(options[:author], options[:title])
    end
  end
end