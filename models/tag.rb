require_relative('../db/sql_runner.rb')

class Tag

  attr_reader :id, :category

  def initialize(options)
    @id = options['id'].to_i
    @category = options['category']
  end

  def save()
    # sql = 'INSERT INTO '
  end

end
