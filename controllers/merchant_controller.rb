require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/merchant' do
  @merchants = Merchant.all()
  erb(:"merchant/index")
end

get '/merchant/new' do
  @merchants = Merchant.all()
    erb(:"merchant/new")
end
#LINK NEW.ERB TO ADD NEW ON MERCHANT

get '/merchant/:id/edit' do
  id = params[:id].to_i()
  @merchants = Merchant.find(id)
  erb(:"merchant/edit")
end
