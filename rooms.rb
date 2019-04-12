class Room
  attr_reader :number, :space, :fee, :songs
  attr_accessor :customers

  def initialize(number, space, fee, songs, customers = [])
    @number = number
    @space = space
    @fee = fee
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
  customers.push(customer)
end


end
