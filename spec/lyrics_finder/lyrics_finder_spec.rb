describe Lyrics::Finder do
  describe 'sets @providers properly on initialization' do
    context 'without specifying providers' do
      let(:finder) { Lyrics::Finder.new }

      it 'sets @providers to default PROVIDERS_LIST' do
        expect(finder.selected_providers).to eq Lyrics::Providers.providers_list
      end
    end

    context 'specifying providers' do
      context 'some providers are invalid' do
        let(:finder) { Lyrics::Finder.new(:lyrics_wikia, :bad_songs) }
        
        it 'filters invalid providers' do
          expect(finder.selected_providers).to match_array [:lyrics_wikia]
        end
      end

      context 'all providers are invalid' do
        let(:finder) { Lyrics::Finder.new(:bad_songs, :invalid_songs) }
        
        it 'sets @providers to default PROVIDERS_LIST' do
          expect(finder.selected_providers).to eq Lyrics::Providers.providers_list
        end
      end
    end
  end # 'initialization'

  describe '#search' do
    describe 'using LyricsWikia as the provider' do
      context 'with a song that can be found' do
        before :each do
          @finder = Lyrics::Finder.new(:lyrics_wikia)
          VCR.use_cassette 'LyricsWikia 200 search' do
            @song = @finder.search("american authors", "best day of my life")
          end
        end

        it 'returns an instance of Array' do
          expect(@song.class).to eq Array
        end

        it 'returns the desired song' do
          expect(@song).to eq LyricsWikiaSampleSongs::BEST_DAY_OF_MY_LIFE
        end
      end

      # Searching for a song that exist but it's not yet on this website.
      context 'with a song that cannot be found' do
        before :each do
          @finder = Lyrics::Finder.new(:lyrics_wikia)
          VCR.use_cassette 'LyricsWikia Song does not exist search' do
            @song = @finder.search("arctic monkeys", "do i wanna know")
          end
        end

        it 'returns nil' do
          expect(@song).to be nil
        end
      end
    end

    describe 'using Azlyrics as the provider' do
      before :each do
        @finder = Lyrics::Finder.new(:azlyrics)
        VCR.use_cassette 'Azlyrics 200 search' do
          @song = @finder.search("american authors", "best day of my life")
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
        @finder = Lyrics::Finder.new(:song_lyrics)
        VCR.use_cassette 'SongLyrics 200 search' do
          @song = @finder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SongLyricsSampleSongs::BEST_DAY_OF_MY_LIFE
      end
    end

    describe 'using LyricsMania as the provider' do
      before :each do
        @finder = Lyrics::Finder.new(:lyrics_mania)
        VCR.use_cassette 'LyricsMania 200 search' do
          @song = @finder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq LyricsManiaSampleSongs::BEST_DAY_OF_MY_LIFE
      end
    end

    describe 'with a song that cannot be found' do
      before :each do
        @finder = Lyrics::Finder.new
        VCR.use_cassette 'Nonexistent Song 404 search' do
          @song = @finder.search("the foobar band", "rubynation")
        end
      end

      it 'returns nil' do
        expect(@song).to be nil
      end
    end

    describe 'with invalid parameters' do
      let(:finder) { Lyrics::Finder.new }

      it 'fails with ContractError' do
        expect{
          finder.search("","")
        }.to raise_error ContractError
      end
    end
  end # '#search'

end