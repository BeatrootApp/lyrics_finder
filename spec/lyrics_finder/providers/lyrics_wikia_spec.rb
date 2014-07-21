# encoding: UTF-8
describe Lyrics::Providers::LyricsWikia do
  describe '.format_url' do
    context 'with valid author and title' do
      let(:klass) { Lyrics::Providers::LyricsWikia }
      let(:song) { Lyrics::Song.new("amëricán authòrs", "best day of my life") }
      let(:valid_url) { "http://lyrics.wikia.com/american_authors:best_day_of_my_life" }

      it 'returns a properly formatted url' do
        expect(klass.format_url(song)).to eq valid_url
      end
    end

    context 'with invalid author or title' do
      let(:klass) { Lyrics::Providers::LyricsWikia }

      it 'with non-string arguments raises a ContractError Exception' do
        expect{
          klass.format_url(2)
        }.to raise_error ContractError
      end

      it 'with empty strings arguments raises a ContractError Exception' do
        expect{
          klass.format_url("")
        }.to raise_error ContractError
      end
    end
  end

  describe '.extract_lyric' do
    # with valid data it's already tested in lyrics_finder_spec.rb
    context 'with invalid data' do
      let(:klass) { Lyrics::Providers::LyricsWikia }

      it 'raises a ContractError Exception' do
        expect{
          klass.extract_lyric("invalid data")
        }.to raise_error ContractError
      end
    end
  end
end