describe LyricsFinder do

  describe '#search' do

    context 'With LyricsWikia as the provider' do
      before :each do
        # LyricsFinder::Providers.stub(:list).and_return([LyricsFinder::Providers::LyricsWikia])
        LyricsFinder::Providers.stub(list: [LyricsFinder::Providers::LyricsWikia])
        VCR.use_cassette 'LyricsWikia 200 search' do
          @song = LyricsFinder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SampleSongs::LYRICS_WIKIA_EXAMPLE
      end
    end

    context 'With LyricsMania as the provider' do
      before :each do
        LyricsFinder::Providers.stub(list: [LyricsFinder::Providers::LyricsMania])
        VCR.use_cassette 'LyricsMania 200 search' do
          @song = LyricsFinder.search("american authors", "best day of my life")
        end  
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SampleSongs::LYRICS_MANIA_EXAMPLE
      end
    end

    context 'With SongLyrics as the provider' do
      before :each do
        LyricsFinder::Providers.stub(list: [LyricsFinder::Providers::SongLyrics])
        VCR.use_cassette 'SongLyrics 200 search' do
          @song = LyricsFinder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SampleSongs::SONG_LYRICS_EXAMPLE
      end
    end

    context 'With Azlyrics as the provider' do
      before :each do
        LyricsFinder::Providers.stub(list: [LyricsFinder::Providers::Azlyrics])
        VCR.use_cassette 'Azlyrics 200 search' do
          @song = LyricsFinder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SampleSongs::AZ_LYRICS_EXAMPLE
      end
    end

    context 'with a sound that does not exist yet in any provider' do
      it 'returns nil' do
        expect(LyricsFinder.search("","")).to eq nil
      end
    end

    context 'with invalid parameters' do
      it 'returns nil' do
        expect(LyricsFinder.search("","")).to eq nil
      end
    end

  end # '#search'

end
