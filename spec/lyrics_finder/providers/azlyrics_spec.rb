# encoding: UTF-8
describe LyricsFinder::Providers::Azlyrics do

  describe '.format_url' do
    context 'with valid author and title' do
      let(:song) { Song.new("amêricàn authors", "best day of my life") }
      let(:az_lyrics) { LyricsFinder::Providers::Azlyrics.new(song) }
      let(:valid_url) { "http://www.azlyrics.com/lyrics/americanauthors/bestdayofmylife.html" }

      it 'returns a properly formatted url' do
        expect(az_lyrics.format_url).to eq valid_url
      end
    end
  end

end