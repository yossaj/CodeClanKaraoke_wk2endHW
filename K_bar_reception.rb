class KaraokeBar

  attr_reader :name, :rooms, :till

  def initialize(name, rooms, till = 0)
    @name = name
    @rooms = rooms
    @till = till
  end

  def add_money_to_till(fee)
    @till += fee
  end

  def charge_customer(room, customer)
    return if customer.cant_afford_room(room)
        customer.remove_money(room.charge)
        add_money_to_till(room.charge)
  end

  def give_customers_room(room, customer)
    charge_customer(room, customer)
    room.add_customer_to_room(customer)
  end


end
