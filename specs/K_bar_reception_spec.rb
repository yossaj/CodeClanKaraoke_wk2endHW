require("minitest/autorun")
require("minitest/rg")
require_relative("../customers.rb")
require_relative("../songs.rb")
require_relative("../K_bar_reception.rb")
require_relative("../rooms.rb")


class KaraokeBarTest < MiniTest::Test

def setup
 @karaoke1 = KaraokeBar.new("Karaoke1")
end

def test_kbar_name
  assert_equal("Karaoke1", @karaoke1.name)
end



end
