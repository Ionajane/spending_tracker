require_relative('../db/sql_runner.rb')

class Transaction
  attr_reader :id, :merchant_id, :tag_id
  attr_accessor :price

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @price = options['price'].to_f
  end

  def save()
    sql = 'INSERT INTO transactions (merchant_id, tag_id, price)
    VALUES ($1, $2, $3) RETURNING id'
    values = [@merchant_id, @tag_id, @price]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM transactions;'
    transactions = SqlRunner.run(sql)
    result = transactions.map {|transaction| Transaction.new(transaction)}
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM tranactions WHERE id = $1;'
    values = [id]
    transaction = SqlRunner.run(sql, values)
    result = Transaction.new(transaction.first)
    return result
  end

  def update()
    sql = 'UPDATE transactions SET (merchant_id, tag_id, price)
    = ($1, $2, $3) WHERE id = ($4);'
    values = [@merchant_id, @tag_id, @price]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM transactions WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM transactions;'
    SqlRunner.run(sql)
  end

#pull through the merchant name, category from tags to show full details
  def transaction_data()
    sql = 'SELECT * FROM merchants;'
    results = SqlRunner.run(sql)
  end

  def merchant()
    sql = 'SELECT name FROM merchants WHERE id = $1'
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def tag()
    sql = 'SELECT category FROM tags WHERE id = $1'
    values = [@tag_id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end



end
