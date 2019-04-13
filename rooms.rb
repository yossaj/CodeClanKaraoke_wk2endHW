class Room
  attr_reader :number, :space, :charge, :songs
  attr_accessor :customers

  def initialize(number, space, charge, songs, customers = [], tab = 0.00)
    @number = number
    @space = space
    @charge = charge
    @songs = songs
    @customers = customers
  end

def add_song(new_song)
  songs.push(new_song)
end

def check_spaces_left
   space_left = (space - customers.count)
end

def add_customer_to_room(customer)
   check_spaces_left > 0 ? customers.push(customer) : "full"
end

def remove_customer_by_name(name)
  customers.delete_if{|customer| customer.name == name }
end

# def add_to_tab
#
# end


end
