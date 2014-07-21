describe Lyrics::Providers do
  describe '.build_klass' do
    context 'with valid arguments' do
      let(:klass) { Lyrics::Providers::LyricsWikia }

      it 'builds the correct class' do
        expect(Lyrics::Providers.build_klass(:lyrics_wikia)).to eq klass
      end
    end

    context 'with invalid arguments' do
      it 'raises a ContractError Exception' do
        expect{
          Lyrics::Providers.build_klass("klass")
        }.to raise_error ContractError
      end
    end
  end
end