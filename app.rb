require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( './controllers/provider_controller' )
require_relative( './controllers/fund_controller' )
require_relative( './controllers/transaction_controller' )
also_reload( './models/*' )

#HOME
get '/' do
  erb( :index )
end
