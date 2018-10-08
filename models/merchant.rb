require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO merchants(name)
    VALUES ($1) RETURNING id;'
    values = [@name]
    merchant_data = SqlRunner.run(sql, values)
    @id = merchant_data.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM merchants;'
    merchants = SqlRunner.run(sql)
    result = merchants.map {|merchant| Merchant.new(merchant)}
    return result
  end

  def update()

  end

  def self.delete_all()

  end

end
