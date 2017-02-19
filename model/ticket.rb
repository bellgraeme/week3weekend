require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize (options)
    @id = options['id'] if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM films WHERE id =#{@id}"  
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO tickets
     (customer_id, film_id)
      VALUES 
      ( #{@customer_id} , #{@film_id} )
       RETURNING id;" 
    ticket = SqlRunner.run(sql)[0]
    @id = ticket['id'].to_i
  end

  def update
    sql = "UPDATE tickets SET (customer_id, film_id) = (#{@customer_id}, #{@film_id}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Ticket.new(ticket)}
    return result    
  end

  def self.all
    sql = "SELECT * FROM tickets"
    return self.get_many(sql) 
  end


  def self.mpf
    film_id_count = "SELECT film_id, COUNT (film_id) AS film_id_count FROM tickets GROUP BY film_id ORDER BY film_id_count DESC LIMIT 1;"
    # sql = "SELECT * FROM films WHERE id = #{film_id_count}"
    # film = sql.map{|film| Film.new(film)}
    return film_id_count


  end


end