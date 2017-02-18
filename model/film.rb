require_relative('../db/sql_runner.rb')
require_relative('customer.rb')

class Film

  attr_reader :id, :title, :price

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def self.delete_all()
    sql = "DELETE  FROM films;"
    SqlRunner.run(sql)
  end
  def delete
    sql = "DELETE FROM films WHERE id =#{@id}"  
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING id;"
    film = SqlRunner.run(sql)[0]
    @id = film['id'].to_i
  end

  def update
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end
  def self.all
    sql = "SELECT * FROM films"
    return self.get_many(sql) 
  end

  def customer
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets ON tickets.customer_id = customers.id
          WHERE tickets.customer_id = #{@id} "
    film = Film.get_many(sql)
    return film
  end

end