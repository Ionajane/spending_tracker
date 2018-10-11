require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/fund.rb' )
require_relative( '../models/provider.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

#INDEX
get '/provider' do
  @providers = Provider.all()
  erb(:"provider/index")
end

#NEW
get '/provider/new' do
  @providers = Provider.all()
  @funds = Fund.all()
  erb(:"provider/new")
end

#SHOW
get '/provider/:id' do
  @provider = Provider.find(params['id'].to_i)
  @funds = Fund.all()
  erb(:"provider/show")
end

#SAVE
post '/provider' do
  @provider = Provider.new(params)
  @provider.save
  redirect ("/provider")
end

#EDIT
get '/provider/:id/edit' do
  id = params[:id].to_i()
  @provider = Provider.find(id)
  erb(:"provider/edit")
end


#UPDATE
post '/provider/:id' do
  @provider = Provider.new(params)
  @provider.update
  redirect ("/provider")
end

#DELETE
post '/provider/:id/delete' do
  id = params[:id].to_i
  Provider.find(id).delete
  erb(:"provider/delete")
end
