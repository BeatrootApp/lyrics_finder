# encoding: UTF-8
describe Providers::Azlyrics do
  describe '.format_url' do
    context 'with valid author and title' do
      let(:klass) { Providers::Azlyrics }
      let(:song) { Song.new("amêricàn authors", "best day of my life") }
      let(:valid_url) { "http://www.azlyrics.com/lyrics/americanauthors/bestdayofmylife.html" }

      it 'returns a properly formatted url' do
        expect(klass.format_url(song)).to eq valid_url
      end
    end
  end
  # '.extract_lyric' happy path already tested in lyrics_finder_spec.rb
end