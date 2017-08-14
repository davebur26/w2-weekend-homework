class Guest

attr_reader(:name,:cash,:fav_artist, :fav_title)
attr_writer(:cash)

def initialize(name,cash, fav_title = nil,fav_artist = nil)
  @name = name
  @cash = cash
  @fav_artist = fav_artist
  @fav_title = fav_title
end


end
