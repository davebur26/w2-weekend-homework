require ("pry")

class Room

attr_reader(:number, :capacity, :playlist, :guestlist, :entry_fee,:guests_with_enough_cash)
attr_writer(:guestlist)

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @playlist = []
    @guestlist = []
    @entry_fee = 6
  end


  def add_guests_to_guestlist(guestlist_check, capacity)
    guestlist_temporary = []
    guest_names_declined = []

    enough_cash(guestlist_check)

    if @guestlist.length > capacity
      binding.pry
      @guestlist = @guestlist.take(capacity)
      guestlist_names_to_drop = guestlist_temporary.drop(capacity)
      guestlist_names_to_drop.each{|guest| guest_names_declined << guest.name}

      puts "Room is full. #{guest_names_declined.join(", ")}, there is not enough room for you."

    else
      guestlist_check.each{|guest| @guestlist << guest}
    end
  end

  def remove_guest_from_guestlist(guest)
    @guestlist = [] if guest == "all"
    @guestlist.delete(guest)
  end

  def add_songs_to_playlist(playlist)
    playlist.each{|song| @playlist << song}
  end

  def enough_cash(guestlist_check)
    guestlist_check.each{|guest| @guestlist << guest if guest.cash >= @entry_fee}
  end

  def fav_song(guestlist,playlist)
    
  end
end
