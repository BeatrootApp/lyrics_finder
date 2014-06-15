require './lib/lyrics_finder'

require 'objspace'

fetcher = LyricsFinder::Fetcher.new([:lyrics_wikia])
puts song_lyric = fetcher.search("Läná dèl rey", "Blue jeans")

puts "CLASS: #{song_lyric.class}"
puts "MEMSIZE: #{ObjectSpace.memsize_of(song_lyric)}"