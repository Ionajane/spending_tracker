require_relative('../db/sql_runner.rb')

class Fund

  attr_reader :id, :category

  def initialize(options)
    @id = options['id'].to_i
    @category = options['category']
  end

  def save()
    sql = 'INSERT INTO funds(category)
    VALUES ($1) RETURNING id;'
    values = [@category]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM funds;'
    funds = SqlRunner.run(sql)
    result = funds.map {|fund| Fund.new(fund)}
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM funds WHERE id = $1;'
    values = [id]
    fund = SqlRunner.run(sql, values)
    result = Fund.new(fund.first)
    return result
  end

  def update()
    sql = 'UPDATE funds SET (category) = $1 WHERE id = ($2);'
    values = [@category]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM funds WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM funds;'
    SqlRunner.run(sql)
  end

end
