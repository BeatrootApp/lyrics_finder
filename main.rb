require './lib/lyrics_finder'

require 'objspace'

puts song_lyric = LyricsFinder.search(author: "Läná dèl rey", title: "Blue jeans")
puts "CLASS: #{song_lyric.class}"
puts "MEMSIZE: #{ObjectSpace.memsize_of(song_lyric)}"