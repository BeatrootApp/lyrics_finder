describe LyricsFinder::Providers do
  describe '.build_klass' do
    let(:klass) { LyricsFinder::Providers::LyricsWikia }

    it 'builds the correct class' do
      expect(LyricsFinder::Providers.build_klass(:lyrics_wikia)).to eq klass
    end
  end
end