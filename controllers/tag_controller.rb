require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/tag.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/tag' do
  @tags = Tag.all()
  erb(:"tag/index")
end

get '/tag/new' do
  erb(:"tag/new")
end

post '/tag' do
  @tags = Tag.new(params)
  @tags.save
  erb(:'tag/create')
end

post '/tag/:id/delete' do
  id = params[:id].to_i
  Tag.find(id).delete
  erb(:'tag/delete')
end
