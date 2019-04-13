require("minitest/autorun")
require("minitest/rg")
require('pry')
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
    @song6 = Song.new("Happy Birthday", "Unknown", "Unknown")
    @song7 = Song.new("Little Weapon", "Lupe Fiasco", "Hip Hop")
    @songs =[@song1,@song2,@song3,@song4,@song5]
    @big_room = Room.new(3, 10, 20, @songs,)
    @customer1 = Customer.new("Mr Zhang", 123)
    @customer2 = Customer.new("Jill", 140)
    @customer3 = Customer.new("Ben", 150)
    @customer4 = Customer.new("Phil", 150)
    @customer5 = Customer.new("Sean", 20)
  end

  def test_room_number
  assert_equal(3, @big_room.number)
  end

  def test_number_of_songs
    assert_equal(5, @big_room.songs.length)
  end

  def test_add_songs
    @big_room.add_song(@song6)
    @big_room.add_song(@song7)
    assert_equal(7, @big_room.songs.length)
  end

  def test_check_spaces_left
    @small_room = Room.new(3, 5, 20, ["songs"],["Bill", "John"])
    result = @small_room.check_spaces_left
    assert_equal(3,result)
  end

  def test_add_customer_to_room
    result = @big_room.add_customer_to_room(@customer1)
    assert_equal(9, @big_room.check_spaces_left)
  end

  def test_add_customer_to_room__multi
    @big_room.add_customer_to_room(@customer1)
    @big_room.add_customer_to_room(@customer2)
    @big_room.add_customer_to_room(@customer3)
    @big_room.add_customer_to_room(@customer4)
    assert_equal(6, @big_room.check_spaces_left)
  end

  def test_add_customer_to_room__full_room
    @full_room = Room.new(4,4,12,["songs"], [@customer1,@customer2,@customer3,@customer4])
    result = @full_room.add_customer_to_room(@customer5)
    assert_equal("full", result)
  end

  def test_remove_customer_from_room
    @full_room = Room.new(4,4,12,["songs"], [@customer1,@customer2,@customer3,@customer4])
    result = @full_room.remove_customer_by_name("Jill")
    assert_equal(1,@full_room.check_spaces_left)
  end

  def test_add_to_tab
    @big_room.add_to_tab(30)
    assert_equal(30, @big_room.tab)
  end






end
