require_relative('../db/sql_runner.rb')

class Transaction
  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :price

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id => options['merchant_id'].to_i
    @tag_id => options[;'tag_id'].to_i
    @price = options['price'].to_f
  end


  # def save()
  #   sql = 'INSERT INTO transactions '
  # end

end
