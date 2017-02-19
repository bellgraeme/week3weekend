class Cinema

  attr_reader :name, :funds

  def initialize (name, funds)
    @name = name
    @funds = funds.to_i
  end

  def sell_ticket(customer, film)
    customer.funds = customer.funds - film.price
    customer.update()
    @funds += film.price
    ticket_sold = Ticket.new({'customer_id' => customer.id, 'film_id' => film.id ,'show' => 2300})
    ticket_sold.save()
    return ticket_sold
  end

end