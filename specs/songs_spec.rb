require("minitest/autorun")
require("minitest/rg")
require_relative("../customers.rb")
require_relative("../songs.rb")
require_relative("../K_bar_reception.rb")
require_relative("../rooms.rb")

class SongTest < MiniTest::Test

def setup
  @song1 = Song.new("Barbie Girl", "Aqua", "90's Pop")
end

def test_name
  assert_equal("Barbie Girl", @song1.title)
end



end
