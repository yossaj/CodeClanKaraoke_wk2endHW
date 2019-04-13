require("minitest/autorun")
require("minitest/rg")
require_relative("../customers.rb")
require_relative("../songs.rb")
require_relative("../K_bar_reception.rb")
require_relative("../rooms.rb")


class KaraokeBarTest < MiniTest::Test

def setup
  @song1 = Song.new("Barbie Girl", "Aqua", "90's Pop")
  @song2 = Song.new("Song 2", "Blur", "Brit Pop")
  @song3 = Song.new("Who Did That to You?", "John Legend","Film Score")
  @song4 = Song.new("Still a Fool", "Muddy Waters", "Blues")
  @song5 = Song.new("Hound Dog", "Elvis Presley", "Rock")
  @song6 = Song.new("Happy Birthday", "Unknown", "Unknown")
  @song7 = Song.new("Little Weapon", "Lupe Fiasco", "Hip Hop")
  @songs =[@song1,@song2,@song3,@song4,@song5]
  @big_room = Room.new(3, 10, 20, @songs,[@customer1])
  @full_room = Room.new(4,4,12,["songs"], [@customer1,@customer2,@customer3,@customer4])
  @lovers_room = Room.new(5,2,10,['songs'],[])
  @customer1 = Customer.new("Mr Zhang", 123)
  @customer2 = Customer.new("Jill", 140)
  @customer3 = Customer.new("Ben", 150)
  @customer4 = Customer.new("Phil", 150)
  @customer5 = Customer.new("Sean", 20)
  @skint_customer = Customer.new("Jimmy", 0)
 @karaoke1 = KaraokeBar.new("Karaoke1",[@big_room,@full_room],100)
end

def test_kbar_name
  assert_equal("Karaoke1", @karaoke1.name)
end

def test_add_money_to_till
  @karaoke1.add_money_to_till(@big_room)
  assert_equal(120,@karaoke1.till)
end

def test_charge_customer
  @karaoke1.charge_customer(@lovers_room, @customer5)
  assert_equal(110,@karaoke1.till)
  assert_equal(10, @customer5.wallet)
end

def test_charge_customer__poor_customer
  @karaoke1.charge_customer(@lovers_room, @skint_customer)
  assert_equal(100,@karaoke1.till)
  assert_equal(0, @skint_customer.wallet)
end


def test_give_customers_room__single
  @karaoke1.give_customers_room(@big_room, @customer2)
  assert_equal(120, @karaoke1.till)
  assert_equal(8, @big_room.check_spaces_left)
end

def test_give_customers_room__multi
  @karaoke1.give_customers_room(@big_room, @customer2)
  @karaoke1.give_customers_room(@big_room, @customer3)
  @karaoke1.give_customers_room(@big_room, @customer4)
  @karaoke1.give_customers_room(@big_room, @customer5)
  assert_equal(180, @karaoke1.till)
  assert_equal(5, @big_room.check_spaces_left)
end



end
