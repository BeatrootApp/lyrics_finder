require './lib/lyrics_finder'

require 'objspace'

#fetcher = LyricsFinder::Fetcher.new(:azlyrics, :song_lyrics, :lyrics_wikia)
fetcher = LyricsFinder::Fetcher.new(:song_lyrics)
puts "\n\n"
#puts song_lyric = fetcher.search("porta", "voy a saco")
puts song_lyric = fetcher.search("american authors", "best day of my life")
#puts song_lyric = fetcher.search("", "")

puts "CLASS: #{song_lyric.class}"
puts "MEMSIZE: #{ObjectSpace.memsize_of(song_lyric)}"