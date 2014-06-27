# LyricsFinder [![Gem Version](https://badge.fury.io/rb/lyrics_finder.svg)](http://badge.fury.io/rb/lyrics_finder) [![Build Status](https://travis-ci.org/dnlR/lyrics_finder.svg?branch=master)](https://travis-ci.org/dnlR/lyrics_finder) [![Coverage Status](https://img.shields.io/coveralls/dnlR/lyrics_finder.svg)](https://coveralls.io/r/dnlR/lyrics_finder?branch=master) [![endorse](https://api.coderwall.com/dnlr/endorsecount.png)](https://coderwall.com/dnlr)

Simple library to search for song lyrics 

## Installation

Add this line to your application's Gemfile:

    gem 'lyrics_finder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lyrics_finder

## Hello World!

Create an instance of `LyricsFinder::Fetcher`:

```ruby
  fetcher = LyricsFinder::Fetcher.new
```

You can specify which websites are you going to get the lyrics from:

```ruby
  fetcher = LyricsFinder::Fetcher.new(:song_lyrics, :azlyrics)
```

You can choose among the following:

- LyricsWikia
- SongLyrics
- AZLyrics

And search passing the author and the song title as parameters to `Fetcher#search`:

```ruby
  fetcher.search 'idina menzel', 'let it go'
```
Which will return and array with all the verses of the song as strings, or `nil` if it cannot found the song in any of the websites.

## Example

In your ruby apps:
```ruby
  require 'lyrics_finder'
  
  fetcher = LyricsFinder::Fetcher.new
  @song = fetcher.search 'idina menzel', 'let it go'
  puts @song
```
    
## CLI

LyricsFinder is also available as a command-line tool.

    $ lyricsfinder search -a 'idina menzel' -t 'let it go'

## Changelog

v 0.0.1

- Initial release

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lyrics_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits

Inspired by [Lyricfy](https://github.com/javichito/Lyricfy).
