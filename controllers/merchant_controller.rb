require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/tag.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/merchant' do
  @merchants = Merchant.all()
  erb(:"merchant/index")
end

get '/merchant/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"merchant/new")
end

post '/merchant' do
  @merchant = Merchant.new(params)
  @merchant.save
  erb(:"tag/create")
end

get '/merchant/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb(:"merchant/show")
end

get '/merchant/:id/edit' do
  id = params[:id].to_i()
  @merchant = Merchant.find(id)
  erb(:"merchant/edit")
end
