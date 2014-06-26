# encoding: UTF-8
describe LyricsFinder::Providers::LyricsWikia do
  describe '.format_url' do
    context 'with valid author and title' do
      let(:klass) { LyricsFinder::Providers::LyricsWikia }
      let(:author) { "amëricán authòrs" }
      let(:song) { "best day of my life" }
      let(:valid_url) { "http://lyrics.wikia.com/american_authors:best_day_of_my_life" }

      it 'returns a properly formatted url' do
        expect(klass.format_url(author, song)).to eq valid_url
      end
    end

    context 'with invalid author or title' do
      let(:klass) { LyricsFinder::Providers::LyricsWikia }

      it 'Contracts raises an exception' do
        skip
      end
    end
  end

  describe '.extract_lyric' do
    # with valid data it's already tested in lyrics_finder_spec.rb
    context 'with invalid data' do
      let(:klass) { LyricsFinder::Providers::LyricsWikia }

      it 'Contracts raises an exception' do
        skip
      end
    end
  end
end