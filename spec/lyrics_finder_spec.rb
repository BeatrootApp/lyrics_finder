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
    describe 'using LyricsWikia as the provider' do
      before :each do
        @fetcher = LyricsFinder::Fetcher.new(:lyrics_wikia)
        VCR.use_cassette 'LyricsWikia 200 search' do
          @song = @fetcher.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq LyricsWikiaSampleSongs::BEST_DAY_OF_MY_LIFE
      end
    end

    describe 'using Azlyrics as the provider' do
      before :each do
        @fetcher = LyricsFinder::Fetcher.new(:azlyrics)
        VCR.use_cassette 'Azlyrics 200 search' do
          @song = @fetcher.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq AzlyricsSampleSongs::BEST_DAY_OF_MY_LIFE
      end
    end

    describe 'using SongLyrics as the provider' do
      before :each do
        @fetcher = LyricsFinder::Fetcher.new(:song_lyrics)
        VCR.use_cassette 'SongLyrics 200 search' do
          @song = @fetcher.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SongLyricsSampleSongs::BEST_DAY_OF_MY_LIFE
      end
    end

    describe 'with a song that cannot be found' do
      before :each do
        @fetcher = LyricsFinder::Fetcher.new
        VCR.use_cassette 'Nonexistent Song 404 search' do
          @song = @fetcher.search("the foobar band", "rubynation")
        end
      end

      it 'returns nil' do
        expect(@song).to be nil
      end
    end

    describe 'with invalid parameters' do
      let(:fetcher) { LyricsFinder::Fetcher.new }

      it 'fails with UsageError' do
        expect{
          fetcher.search("", "")
        }.to raise_error( LyricsFinder::Fetcher::UsageError,
                          "You must supply a valid author and title")
      end
    end
  end # '#search'

end