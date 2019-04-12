require("minitest/autorun")
require("minitest/rg")
require_relative("../customers.rb")
require_relative("../songs.rb")
require_relative("../K_bar_reception.rb")
require_relative("../rooms.rb")

class CustomerTest < MiniTest::Test

def setup
  @customer1 = Customer.new("Mr Zhang", 200)
end

def test_customer_name
assert_equal("Mr Zhang", @customer1.name)
end


end
