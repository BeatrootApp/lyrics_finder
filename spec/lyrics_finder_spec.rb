require 'spec_helper'

describe LyricsFinder::Fetcher do
  describe 'sets @providers properly on initialization' do
    context 'without specifying providers' do
      let(:fetcher) { LyricsFinder::Fetcher.new }

      it 'sets @providers to default PROVIDERS_LIST' do
        expect(fetcher.providers).to eq LyricsFinder::Fetcher::PROVIDERS_LIST
      end
    end

    context 'specifying providers' do
      context 'some providers are invalid' do
        let(:fetcher) { LyricsFinder::Fetcher.new(:lyrics_wikia, :bad_songs) }
        
        it 'filters invalid providers' do
          expect(fetcher.providers).to match_array [:lyrics_wikia]
        end
      end

      context 'all providers are invalid' do
        let(:fetcher) { LyricsFinder::Fetcher.new(:bad_songs, :invalid_songs) }
        
        it 'sets @providers to default PROVIDERS_LIST' do
          expect(fetcher.providers).to eq LyricsFinder::Fetcher::PROVIDERS_LIST
        end
      end
    end
  end # 'initialization'

  describe '#search' do
    context 'with valid parameters' do

      describe 'using LyricsWikia as the provider' do
        context 'when the song is found' do
          before :each do
            @fetcher = LyricsFinder::Fetcher.new(:lyrics_wikia)
            VCR.use_cassette 'LyricsWikia 200 search' do
              @song = @fetcher.search("american authors", "best day of my life")
            end
          end

          it 'returns an instance of Array' do
            expect(@song.class).to eq Array
          end

          it 'matches the desired song' do
            expect(@song).to eq ExampleSongs::BEST_DAY_OF_MY_LIFE
          end
        end

        context 'when the song is not found' do
          before :each do
            @fetcher = LyricsFinder::Fetcher.new(:lyrics_wikia)
            VCR.use_cassette 'LyricsWikia 404 search' do
              @song = @fetcher.search("the foobar band", "rubynation")
            end
          end

          it 'returns nil' do
            expect(@song).to be nil
          end
        end
      end
    end

    context 'with invalid parameters' do
      let(:fetcher) { LyricsFinder::Fetcher.new(:lyrics_wikia) }

      it 'fails with UsageError' do
        expect{
          fetcher.search("", "")
        }.to raise_error( LyricsFinder::Fetcher::UsageError,
                          "You must supply a valid author and title")
      end
    end
  end # '#search'

end