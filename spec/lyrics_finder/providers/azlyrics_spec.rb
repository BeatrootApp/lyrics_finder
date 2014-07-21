# encoding: UTF-8
describe Lyrics::Providers::Azlyrics do
  describe '.format_url' do
    context 'with valid author and title' do
      let(:klass) { Lyrics::Providers::Azlyrics }
      let(:song) { Lyrics::Song.new("amêricàn authors", "best day of my life") }
      let(:valid_url) { "http://www.azlyrics.com/lyrics/americanauthors/bestdayofmylife.html" }

      it 'returns a properly formatted url' do
        expect(klass.format_url(song)).to eq valid_url
      end
    end
  end

  describe '.extract_lyric' do
    # with valid data it's already tested in lyrics_finder_spec.rb
    context 'with invalid data' do
      let(:klass) { Lyrics::Providers::Azlyrics }

      it 'raises a ContractError Exception' do
        expect{
          klass.extract_lyric(3.14)
        }.to raise_error ContractError
      end
    end
  end
end