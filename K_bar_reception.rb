class KaraokeBar

  attr_reader :name, :rooms, :till, :snacks

  def initialize(name, rooms, till = 0, snacks = Hash.new)
    @name = name
    @rooms = rooms
    @till = till
    @snacks = snacks
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

  def find_snack_price(name)
    price = @snacks[name]
  end

  def charge_customer_for_snack(snack,customer,room)
    room.add_to_tab(@snacks[snack])
    customer.remove_money(@snacks[snack])

  end



end
