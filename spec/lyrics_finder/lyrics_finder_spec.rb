describe LyricsFinder do

  describe '#search' do

    context 'with a song that can be found' do
      before :each do
        VCR.use_cassette 'LyricsWikia 200 search' do
          @song = LyricsFinder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq LyricsWikiaSampleSongs::BEST_DAY_OF_MY_LIFE
      end
    end

    context 'with invalid parameters' do
      it 'fails with ContractError' do
        expect(LyricsFinder.search("","")).to eq nil
      end
    end

  end # '#search'

end
