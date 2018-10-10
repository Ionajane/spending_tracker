require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/fund.rb' )
require_relative( '../models/provider.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/provider' do
  @providers = Provider.all()
  erb(:"provider/index")
end

get '/provider/new' do
  @providers = Provider.all()
  @funds = Fund.all()
  erb(:"merchant/new")
end

get '/provider/:id' do
  @provider = Provider.find(params['id'].to_i)
  @funds = Fund.all()
  erb(:"provider/show")
end

post '/provider' do
  @provider = Provider.new(params)
  @provider.save
  erb(:"provider/create")
end

get '/provider/:id/edit' do
  id = params[:id].to_i()
  @provider = Provider.find(id)
  erb(:"provider/edit")
end

post '/provider/:id' do
  @provider = Provider.new(params)
  @funds = Fund.all()
  redirect to ("/provider")
end
