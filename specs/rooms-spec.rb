require("minitest/autorun")
require("minitest/rg")
require_relative("../customers.rb")
require_relative("../songs.rb")
require_relative("../K_bar_reception.rb")
require_relative("../rooms.rb")

class RoomsTest < MiniTest::Test

  def setup
    @song1 = Song.new("Barbie Girl", "Aqua", "90's Pop")
    @song2 = Song.new("Song 2", "Blur", "Brit Pop")
    @song3 = Song.new("Who Did That to You?", "John Legend","Film Score")
    @song4 = Song.new("Still a Fool", "Muddy Waters", "Blues")
    @song5 = Song.new("Hound Dog", "Elvis Presley", "Rock")
    @songs =[@song1,@song2,@song3,@song4,@song5]
    @big_room = Room.new(3, 10, 20, @songs)

  end

  def test_room_number
  assert_equal(3, @big_room.number)
  end

  def test_number_of_songs
    assert_equal(5, @big_room.songs.length)
  end


end
