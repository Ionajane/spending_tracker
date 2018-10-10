require_relative('../db/sql_runner.rb')

class Transaction
  attr_reader :id, :provider_id, :fund_id
  attr_accessor :price

  def initialize(options)
    @id = options['id'].to_i
    @provider_id = options['provider_id'].to_i
    @fund_id = options['fund_id'].to_i
    @price = options['price'].to_f
  end

  def save()
    sql = 'INSERT INTO transactions (provider_id, fund_id, price)
    VALUES ($1, $2, $3) RETURNING id'
    values = [@provider_id, @fund_id, @price]
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
    sql = 'UPDATE transactions SET (provider_id, fund_id, price)
    = ($1, $2, $3) WHERE id = ($4);'
    values = [@provider_id, @fund_id, @price]
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

  def transaction_data()
    sql = 'SELECT * FROM providers;'
    results = SqlRunner.run(sql)
  end

  def provider()
    sql = 'SELECT name FROM providers WHERE id = $1'
    values = [@provider_id]
    results = SqlRunner.run(sql, values)
    return Provider.new(results.first)
  end

  def fund()
    sql = 'SELECT category FROM funds WHERE id = $1'
    values = [@fund_id]
    results = SqlRunner.run(sql, values)
    return Fund.new(results.first)
  end



end
