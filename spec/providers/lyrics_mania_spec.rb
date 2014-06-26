describe LyricsFinder::Providers::LyricsMania do
  describe '.format_url' do
    context 'with valid author and title' do
      let(:klass) { LyricsFinder::Providers::LyricsMania }
      let(:author) { "amèricàn aüthors" }
      let(:song) { "best day of my life" }
      let(:valid_url) { "http://www.lyricsmania.com/best_day_of_my_life_lyrics_american_authors.html" }

      it 'returns a properly formatted url' do
        expect(klass.format_url(author, song)).to eq valid_url
      end
    end
  end
end