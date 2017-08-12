require ("pry")
require('minitest/autorun')
require('minitest/rg')
require_relative('../Room.rb')
require_relative('../Guest.rb')
require_relative('../Song.rb')

class RoomTest < MiniTest::Test

  def test_room_number
    room1 = Room.new(1,2)
    room2 = Room.new(2,2)
    room_number_1 = room1.number
    room_number_2 = room2.number
    assert_equal(1,room_number_1)
    assert_equal(2,room_number_2)
  end

  def test_room_capacity
    room3 = Room.new(3,6)
    room3_capacity = room3.capacity
    assert_equal(6,room3_capacity)
  end

  def test_guestlist_empty
    room2 = Room.new(2,2)
    room2_guestlist = room2.guestlist
    assert_equal([],room2_guestlist)
  end

  def test_playlist_empty
    room2 = Room.new(2,2)
    room2_playlist = room2.playlist
    assert_equal([],room2_playlist)
  end

  def test_add_guests_to_guestlist
    room1 = Room.new(1,3)
    guest1 = Guest.new("David",10)
    guest2 = Guest.new("Tom",3)
    guest3 = Guest.new("Terry",11)
    guest4 = Guest.new("Garry",12)

    guestlist = [guest1, guest2, guest3, guest4]

    room1_guestlist = room1.add_guests_to_guestlist(guestlist,room1.capacity)

    # assert_equal(2,room1.guestlist.length)
    assert_equal("David",room1.guestlist[0].name)
    assert_equal(12,room1.guestlist[2].cash)
    # assert_equal("Tom",room1.guestlist[1].name)
    # assert_equal("Terry",room1_guestlist[2].name)
  end

  def test_remove_guest_from_guestlist
    room1 = Room.new(1,3)
    guest1 = Guest.new("David",0)
    guest2 = Guest.new("Tom",0)
    guest3 = Guest.new("Terry",0)
    guestlist = [guest1, guest2, guest3]

    # removes all guests from the guestlist
    room1.remove_guest_from_guestlist("all")

    assert_equal(0,room1.guestlist.length)

    room1.add_guests_to_guestlist(guestlist,room1.capacity)
    # removes specific guest from the guestlist
    room1.remove_guest_from_guestlist(guest1)

    assert_equal(2,room1.guestlist.length)
    assert_equal("Tom",room1.guestlist[0].name)
  end

  def test_add_song_to_playlist
    room1 = Room.new(1,2)
    song1 = Song.new("lalala","Pope")
    song2 = Song.new("Wonderwall","Oasis")
    song3 = Song.new("Wonderwall","Oasis")

    playlist = [song1, song2, song3]

    room1_playlist = room1.add_songs_to_playlist(playlist)

    assert_equal(3,room1_playlist.length)
    assert_equal("Wonderwall",room1_playlist[2].title)
    assert_equal("Oasis",room1_playlist[2].artist)
  end

  def test_enough_cash
    guest1 = Guest.new("David",12)
    guest2 = Guest.new("Tom",5)
    guest3 = Guest.new("Terry",8)
    guestlist = [guest1, guest2, guest3]

    room1.enough_cash(guestlist)

    assert_equal(2, room1.guestlist.length)
    assert_equal(12, room1.guestlist[0].cash)
  end

  def test_fav_song
    guest1 = Guest.new("David",12,"Porcelin","Moby")
    guest1 = Guest.new("David",12)
    song1 = Song.new("Munich","Editors")
    song2 = Song.new("Porcelin","Moby")

    guestlist = [guest1, guest2]
    playlist = [song1, song2]

    room1.fav_song(guestlist,playlist)

    assert_equal("Porcelin",)




end
