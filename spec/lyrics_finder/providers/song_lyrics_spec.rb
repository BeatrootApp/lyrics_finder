# encoding: UTF-8
describe LyricsFinder::Providers::SongLyrics do

  describe '.format_url' do
    context 'with valid author and title' do
      let(:song) { Song.new("amêricàn authors", "best day of my life") }
      let(:song_lyrics) { LyricsFinder::Providers::SongLyrics.new(song) }
      let(:valid_url) { "http://www.songlyrics.com/american-authors/best-day-of-my-life-lyrics/" }

      it 'returns a properly formatted url' do
        expect(song_lyrics.format_url).to eq valid_url
      end
    end
  end

end