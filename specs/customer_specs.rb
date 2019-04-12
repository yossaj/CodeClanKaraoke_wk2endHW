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


end
