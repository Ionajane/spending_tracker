require_relative('../db/sql_runner.rb')

class Tag

  attr_reader :id, :category

  def initialize(options)
    @id = options['id'].to_i
    @category = options['category']
  end

  def save()
    sql = 'INSERT INTO tags(category)
    VALUES ($1) RETURNING id;'
    values = [@category]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM tags;'
    tags = SqlRunner.run(sql)
    result = tags.map {|tag| Tag.new(tag)}
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM tags WHERE id = $1;'
    values = [id]
    tag = SqlRunner.run(sql, values)
    result = Tag.new(tag.first)
    return result
  end

  def update()
    sql = 'UPDATE tags SET (category) = $1 WHERE id = ($2);'
    values = [@category]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM tags WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM tags;'
    SqlRunner.run(sql)
  end

end
