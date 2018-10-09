require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/tag' do
  @tags = Tag.all()
  erb(:"tag/index")
end
