require ("pry")

class Room

attr_reader(:number, :capacity, :playlist, :guestlist, :entry_fee,:guests_with_enough_cash, :room_tab, :room_cash_available)
attr_writer(:guestlist, :room_tab, :room_cash_available)

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @playlist = []
    @guestlist = []
    @entry_fee = 6
    @room_tab = []
    @room_cash_available = 0
  end


  def add_guests_to_guestlist(guestlist_check, room)
    guestlist_temporary = []
    guest_names_declined = []

    enough_cash(guestlist_check)

    if guestlist.length > capacity
      @guestlist = @guestlist.take(room.capacity)
      guestlist_names_to_drop = guestlist_temporary.drop(room.capacity)
      guestlist_names_to_drop.each{|guest| guest_names_declined << guest.name}

      puts "Room is full. #{guest_names_declined.join(", ")}, there is not enough room for you."

    else
      guestlist_check.each{|guest| @guestlist << guest}
      # takes off entry fee
    end
      # I dont think the classes in array are linked to original array?

      room.guestlist.each{|guest| guest.cash -= entry_fee}
  end

  def remove_guest_from_guestlist(guest)
    @guestlist = [] if guest == "all"
    @guestlist.delete(guest)
  end

  def add_songs_to_playlist(playlist)
    playlist.each{|song| @playlist << song}
  end

  def enough_cash(guestlist_check)
    guestlist_check.each{|guest| guestlist << guest if guest.cash >= entry_fee}


  end

  def fav_song(guestlist,playlist)
    playlist_title_only = []
    fav_song_title_only = []

    playlist.each{|song| playlist_title_only << song.title}
    guestlist.each{|song| fav_song_title_only << song.fav_title}

    "This is my favourite song" if (playlist_title_only & fav_song_title_only).any?

    #Could also add the favourite tracks to an array and then use .each to puts out
  end

  def add_guest_cash_to_room(proposed_amount)
# Not finished
    temp_guest_kitty = 0
    guestlist.each{|guest| temp_guest_kitty += guest.cash }
    room_cash_available += proposed_amount if temp_guest_kitty >= proposed_amount
  end


end
