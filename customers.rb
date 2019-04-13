class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet = 0)
    @name = name
    @wallet = wallet
    # @favorite_song =
  end

  def remove_money(room)
     @wallet > 0 ? @wallet -= room.fee : false
  end

  def cant_afford_room(room)
    @wallet < room.fee
  end

end
