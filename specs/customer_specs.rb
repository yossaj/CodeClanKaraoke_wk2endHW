require("minitest/autorun")
require("minitest/rg")
require_relative("../customers.rb")
require_relative("../songs.rb")
require_relative("../K_bar_reception.rb")
require_relative("../rooms.rb")

class CustomerTest < MiniTest::Test

  def setup
    @song1 = Song.new("Barbie Girl", "Aqua", "90's Pop")
    @song2 = Song.new("Song 2", "Blur", "Brit Pop")
    @song3 = Song.new("Who Did That to You?", "John Legend","Film Score")
    @song4 = Song.new("Still a Fool", "Muddy Waters", "Blues")
    @song5 = Song.new("Hound Dog", "Elvis Presley", "Rock")
    @song6 = Song.new("Happy Birthday", "Unknown", "Unknown")
    @song7 = Song.new("Little Weapon", "Lupe Fiasco", "Hip Hop")
    @songs =[@song1,@song2,@song3,@song4,@song5]
    @big_room = Room.new(3, 10, 20, @songs)
    @customer1 = Customer.new("Mr Zhang", 123)
    @customer2 = Customer.new("Jill", 140)
    @customer3 = Customer.new("Ben", 150)
    @customer4 = Customer.new("Phil", 150)
    @customer5 = Customer.new("Sean", 20)
  end

  def test_customer_name
  assert_equal("Mr Zhang", @customer1.name)
  end

  def test_remove_money
  @customer3.remove_money(@big_room.charge)
  assert_equal(130, @customer3.wallet)
  end

  def test_remove_money__skint
    @skint_customer = Customer.new("Jimmy", 0)
    @skint_customer.remove_money(@big_room.charge)
    assert_equal(0,@skint_customer.wallet)
  end

  def test_cant_afford_room__true
    @skint_customer = Customer.new("Jimmy", 0)
    result = @skint_customer.cant_afford_room(@big_room)
    assert_equal(true, result)
  end


  def test_cant_afford_room__false
    result = @customer1.cant_afford_room(@big_room)
    assert_equal(false, result)
  end
  #
  def test_favorites_song
    @music_fan = Customer.new("Neil", 40, "Barbie Girl")
    assert_equal("Barbie Girl", @music_fan.favorite_song )
  end

  def test_cheer_for_song
    @music_fan2 = Customer.new("Tom", 32, "Song 2")
    result = @music_fan2.cheer_for_song(@big_room)
    assert_equal("Wooo Hoooo", result)
  end

  def test_cheer_for_song__unfound
    @music_fan3 = Customer.new("Matt", 32, "Lonely Boy")
    result = @music_fan3.cheer_for_song(@big_room)
    assert_equal("I can't believe they don't have that song!", result)
  end




end
