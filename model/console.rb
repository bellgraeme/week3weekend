require 'pry'
require_relative('cinema.rb')
require_relative('film.rb')
require_relative('ticket.rb')
require_relative('customer.rb')

Customer.delete_all
Film.delete_all
Ticket.delete_all

cinema = Cinema.new('cinema', 0)

customer1 = Customer.new('name' => 'Garth', 'funds' => 20)
customer1.save()

customer2 = Customer.new('name' => 'Richard', 'funds' => 25)
customer2.save()

customer3 = Customer.new('name' => 'Kelly', 'funds' => 10)
customer3.save()

customer4 = Customer.new('name' => 'Sarah', 'funds' => 35)
customer4.save()

film1 = Film.new('title' => 'Dances with Wombles', 'price' => 4)
film1.save()

film2 = Film.new('title' => 'Mission Impossibru', 'price' => 5)
film2.save()

film3 = Film.new('title' => 'Jaws 25, The final final final bite!', 'price' => 6)
film3.save()

film4 = Film.new('title' => 'Star Trekking through the Universe', 'price' => 7)
film4.save()

ticket1 = Ticket.new('customer_id' => customer1.id, 'film_id' => film1.id)
ticket1.save()

ticket2 = Ticket.new('customer_id' => customer2.id, 'film_id' => film2.id)
ticket2.save()

ticket3 = Ticket.new('customer_id' => customer3.id, 'film_id' => film3.id)
ticket3.save()

ticket4 = Ticket.new('customer_id' => customer4.id, 'film_id' => film4.id)
ticket4.save()

ticket5 = cinema.sell_ticket(customer4, film2)


binding.pry
nil
