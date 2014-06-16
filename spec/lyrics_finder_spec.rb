require 'spec_helper'

describe LyricsFinder do
  it 'validates initialization process' do
    skip
  end

  describe '#search' do
    context 'with valid parameters' do

      describe 'using LyricsWikia as the provider' do
        subject { @song }

        context 'when the song is found' do
          before :each do
            @fetcher = LyricsFinder::Fetcher.new(:lyrics_wikia)
            VCR.use_cassette 'LyricsWikia 200 search' do
              @song = @fetcher.search("the xx", "islands")
            end
          end

          it 'is an instance of Array' do
            expect(@song.class).to eq Array
          end

          it 'matches the desired song' do
            skip
          end
        end

        context 'when the song is not found' do
          before :each do
            @fetcher = LyricsFinder::Fetcher.new(:lyrics_wikia)
            VCR.use_cassette 'LyricsWikia 404 search' do
              @song = @fetcher.search("the foobar band", "rubynation")
            end
          end

          it 'is nil' do
            expect(@song).to be nil
          end
        end
      end
    end

    context 'with invalid parameters' do
      skip
    end
  end
end