require './lib/lyrics_finder'

require 'objspace'

song_lyric = LyricsFinder.search(author: "Lrëy", title: "Blue jeans")
puts "CLASS: #{song_lyric.class}"
puts "MEMSIZE: #{ObjectSpace.memsize_of(song_lyric)}"