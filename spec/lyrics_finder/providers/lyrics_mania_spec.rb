# encoding: UTF-8
describe LyricsFinder::Providers::LyricsMania do

  describe '.format_url' do
    context 'with valid author and title' do
      let(:song) { Song.new("amêricàn authors", "best day of my life") }
      let(:lyrics_mania) { LyricsFinder::Providers::LyricsMania.new(song) }
      let(:valid_url) { "http://www.lyricsmania.com/best_day_of_my_life_lyrics_american_authors.html" }

      it 'returns a properly formatted url' do
        expect(lyrics_mania.format_url).to eq valid_url
      end
    end
  end

end