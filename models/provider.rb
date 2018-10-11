require_relative('../db/sql_runner.rb')

class Provider

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @fund_id = options['fund_id'].to_i
  end

  def save()
    sql = 'INSERT INTO providers(name, fund_id)
    VALUES ($1, $2) RETURNING id;'
    values = [@name, @fund_id]
    provider_data = SqlRunner.run(sql, values)
    @id = provider_data.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM providers;'
    providers = SqlRunner.run(sql)
    result = providers.map {|provider| Provider.new(provider)}
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM providers WHERE id = $1;'
    values = [id]
    provider = SqlRunner.run(sql, values)
    result = Provider.new(provider.first)
    return result
  end

  def update()
    sql = 'UPDATE providers
    SET (name, fund_id) = ($1, $2)
    WHERE id = $3;'
    values =[@name, @fund_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM providers WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM providers;'
    SqlRunner.run(sql)
  end

  def fund()
    sql = 'SELECT category FROM funds WHERE id = $1;'
    values = [@fund_id]
    results = SqlRunner.run(sql, values)
    return Fund.new(results.first)
  end

end
