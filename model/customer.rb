require_relative('../db/sql_runner.rb')
require_relative('ticket.rb')
require_relative('film.rb')


class Customer

  attr_reader :id, :name
  attr_accessor :funds

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def self.delete_all
    sql = "DELETE  FROM customers;"
    SqlRunner.run(sql) 
  end

  def delete
    sql = "DELETE FROM customers WHERE id =#{@id}"  
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM customers"
    return self.get_many(sql) 
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING id;"
    customer = SqlRunner.run(sql)[0]
    @id =customer['id'].to_i   
  end

  def self.get_many(sql)
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def film
    sql = "SELECT films.* FROM films
    INNER JOIN tickets on tickets.film_id = films.id
    WHERE tickets.customer_id = #{@id}"
    film = Film.get_many(sql)
    return film
    
  end

  def ticket
    sql = "SELECT * FROM tickets
          WHERE customer_id = #{@id} "
    tickets = Ticket.get_many(sql)
    return tickets
  end
end