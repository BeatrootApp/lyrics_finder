# encoding: UTF-8
describe LyricsFinder::Providers::LyricsWikia do

  describe '.format_url' do
    context 'with valid author and title' do
      let(:song) { Song.new("amëricán authòrs", "best day of my life") }
      let(:lyrics_wikia) { LyricsFinder::Providers::LyricsWikia.new(song) }
      let(:valid_url) { "http://lyrics.wikia.com/american_authors:best_day_of_my_life" }

      it 'returns a properly formatted url' do
        expect(lyrics_wikia.format_url).to eq valid_url
      end
    end
  end

end