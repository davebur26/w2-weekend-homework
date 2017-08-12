require('minitest/autorun')
require('minitest/rg')
require_relative('../Song.rb')

class SongTest < MiniTest::Test

  def test_song_title
    song1 = Song.new("Waterloo","Abba")
    assert_equal("Waterloo",song1.title)
  end

  def test_song_artist
    song1 = Song.new("Waterloo","Abba")
    assert_equal("Abba",song1.artist)
  end

end
