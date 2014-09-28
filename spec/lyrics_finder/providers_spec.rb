describe LyricsFinder::Providers do
  describe '.build_klass' do
    context 'with valid arguments' do
      let(:klass) { Providers::LyricsWikia }

      it 'builds the correct class' do
        expect(LyricsFinder::Providers.build_klass(:lyrics_wikia)).to eq klass
      end
    end

    context 'with invalid arguments' do
      it 'raises a ContractError Exception' do
        expect{
          LyricsFinder::Providers.build_klass("klass")
        }.to raise_error ContractError
      end
    end
  end
end