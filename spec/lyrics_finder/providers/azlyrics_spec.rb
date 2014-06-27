# encoding: UTF-8
describe LyricsFinder::Providers::Azlyrics do
  describe '.format_url' do
    context 'with valid author and title' do
      let(:klass) { LyricsFinder::Providers::Azlyrics }
      let(:author) { "amêricàn authors" }
      let(:song) { "best day of my life" }
      let(:valid_url) { "http://www.azlyrics.com/lyrics/americanauthors/bestdayofmylife.html" }

      it 'returns a properly formatted url' do
        expect(klass.format_url(author, song)).to eq valid_url
      end
    end
  end
  # '.extract_lyric' happy path already tested in lyrics_finder_spec.rb
end