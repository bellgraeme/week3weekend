require_relative ('ticket.rb')
require_relative ('film.rb')
require_relative ('customer.rb')
require 'pry'

class Cinema 

  attr_accessor :name, :funds

  def initialize (name)
    @name = name
  
  
  end


  def self.setup
    @film1 = Film.new('title' => 'Dances with Wombles', 'price' => 4)
    @film1.save()
    @film2 = Film.new('title' => 'Mission Impossibru', 'price' => 5)
    @film2.save()
    @film3 = Film.new('title' => 'Jaws 18, The Final Final Final Bite Again!', 'price' => 6)
    @film3.save()
    @film4 = Film.new('title' => 'Star Trekking through the Universe', 'price' => 7)
    @film4.save()
  end


  @funds = 0

  @screen1 = 0
  @screen2 = 0
  @screen3 = 0
  @screen4 = 0
  


  def self.sell_ticket(customer)
    self.setup
    puts "Would you like to see: \n 1. Dances with Wombles? \n 2. Mission Impossibru? \n 3. Jaws 18, The Final Final Final Bite Again? \n 4. Star Trekking through the Universe?"
    answer = gets.chomp.to_i
    case answer
    when 1
      if @screen1 < 40
        @screen1 += 1
        # binding.pry
        customer.funds = customer.funds - @film1.price
        customer.update()
        @funds += @film1.price
        ticket_sold = Ticket.new({'customer_id' => customer.id, 'film_id' => @film1.id ,'show' => Time.now})
        ticket = ticket_sold.save()
        puts "Good choice, I see you are  a person of refined taste"
        return ticket
      else puts "Sorry comupter says: No"
      end
    when 2
      if  @screen1 < 40
        @screen1 += 1
        customer.funds = customer.funds - @film2.price
        customer.update()
        @funds += @film2.price
        ticket_sold = Ticket.new({'customer_id' => customer.id, 'film_id' => @film2.id ,'show' => Time.now})
        ticket_sold.save()
        puts "Good choice, I see you are  a person of refined taste"
        return ticket_sold
      else puts "Sorry comupter says: No"
      end

    when 3
      if  @screen3 < 40
        @screen3 += 1
        customer.funds = customer.funds - @film3.price
        customer.update()
        @funds += @film3.price
        ticket_sold = Ticket.new({'customer_id' => customer.id, 'film_id' => @film3.id ,'show' => Time.now})
        ticket_sold.save()
        puts "Good choice, I see you are  a person of refined taste"
        return ticket_sold
      else puts "Sorry comupter says: No"
      end
    when 4
      if  @screen4 < 40
        @screen4 += 1
        customer.funds = customer.funds - @film4.price
        customer.update()
        @funds += @film4.price
        ticket_sold = Ticket.new({'customer_id' => customer.id, 'film_id' => @film4.id ,'show' => Time.now})
        ticket_sold.save()
        puts "Good choice, I see you are a person of refined taste"
        return ticket_sold
      else puts "Sorry comupter says: No"
      end
    end
  end
end

