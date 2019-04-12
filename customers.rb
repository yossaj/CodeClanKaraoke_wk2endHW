class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet = 0)
    @name = name
    @wallet = wallet
  end

  def remove_money(room)
     @wallet > 0 ? @wallet -= room.fee : false
  end

end
