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

Search passing the author and the song title as parameters to `LyricsFinder.search`:

```ruby
  finder.search 'idina menzel', 'let it go'
```
Which will return and array with all the verses of the song as strings, or `nil` if the song cannot be found.

## Example

In your ruby apps:
```ruby
  require 'lyrics_finder'
  
  @song = LyricsFinder.search 'idina menzel', 'let it go'
  
  puts @song
```
    
## CLI

LyricsFinder is also available as a command-line tool.

    $ lyricsfinder search -a 'idina menzel' -t 'let it go'

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lyrics_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request