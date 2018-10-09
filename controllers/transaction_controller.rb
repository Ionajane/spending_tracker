require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/tag.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/transaction' do
  @transactions = Transaction.all()
  erb(:"transaction/index")
end
