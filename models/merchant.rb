require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = 'INSERT INTO merchants(name, tag_id)
    VALUES ($1, $2) RETURNING id;'
    values = [@name, @tag_id]
    merchant_data = SqlRunner.run(sql, values)
    @id = merchant_data.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM merchants;'
    merchants = SqlRunner.run(sql)
    result = merchants.map {|merchant| Merchant.new(merchant)}
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM merchants WHERE id = $1;'
    values = [id]
    merchant = SqlRunner.run(sql, values)
    result = Merchant.new(merchant.first)
    return result
  end

  def update()
    sql = 'UPDATE merchants SET (name, tag_id) = ($1, $2)
    WHERE id ($3);'
    values =[@name, @tag_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM merchants WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM merchants;'
    SqlRunner.run(sql)
  end

  def tag()
    sql = 'SELECT * FROM tags;'
    SqlRunner.run(sql)

  end

end
