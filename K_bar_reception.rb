class KaraokeBar

  attr_reader :name, :rooms, :till

  def initialize(name, rooms, till = 0)
    @name = name
    @rooms = rooms
    @till = till
  end

  def add_money_to_till(room)
    @till += room.fee
  end

  def charge_customer(room, customer)
    return if customer.cant_afford_room(room)
        customer.remove_money(room)
        add_money_to_till(room)
  end


end
