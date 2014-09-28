# encoding: UTF-8
describe LyricsFinder::Providers::LyricsWikia do

  describe '.format_url' do
    context 'with valid author and title' do
      let(:klass) { LyricsFinder::Providers::LyricsWikia }
      let(:song) { Song.new("amëricán authòrs", "best day of my life") }
      let(:valid_url) { "http://lyrics.wikia.com/american_authors:best_day_of_my_life" }

      it 'returns a properly formatted url' do
        expect(klass.format_url(song)).to eq valid_url
      end
    end
  end

  describe '.extract_lyric' do
    # with valid data it's already tested in lyrics_finder_spec.rb
    context 'with invalid data' do
      let(:klass) { LyricsFinder::Providers::LyricsWikia }

      it 'raises a ContractError Exception' do
        expect{
          klass.extract_lyric("invalid data")
        }.to raise_error ContractError
      end
    end
  end

end