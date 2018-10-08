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
    sql = 'INSERT INTO transactions (merchant_id, tag_id)
    VALUES ($1, $2) RETURNING id'
    values = [@merchant_id, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
