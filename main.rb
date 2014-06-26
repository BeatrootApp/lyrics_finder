require './lib/lyrics_finder'

require 'objspace'

fetcher = LyricsFinder::Fetcher.new(:azlyrics,:song_lyrics,:lyrics_wikia)
puts song_lyric = fetcher.search("american authors", "best day of my life")

puts "CLASS: #{song_lyric.class}"
puts "MEMSIZE: #{ObjectSpace.memsize_of(song_lyric)}"