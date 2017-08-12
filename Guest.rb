class Guest

attr_reader(:name,:cash,:fav_song)

def initialize(name,cash,fav_artist = nil, fav_title = nil)
  @name = name
  @cash = cash
  @fav_artist = fav_artist
  @fav_title = fav_title
end


end
