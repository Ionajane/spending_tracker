require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/fund.rb' )
require_relative( '../models/provider.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/fund' do
  @funds = Fund.all()
  erb(:"fund/index")
end

get '/fund/new' do
  erb(:"fund/new")
end

post '/fund' do
  @funds = Fund.new(params)
  @funds.save
  erb(:'fund/create')
end

post '/fund/:id/delete' do
  id = params[:id].to_i
  Fund.find(id).delete
  erb(:'fund/delete')
end
