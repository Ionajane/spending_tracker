require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/fund.rb' )
require_relative( '../models/provider.rb' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

#INDEX
get '/transaction' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  erb(:"transaction/index")
end

#NEW
get '/transaction/new' do
  @transactions = Transaction.all()
  @providers = Provider.all()
  @funds = Fund.all()
  erb(:"transaction/new")
end

#SHOW
get '/transaction/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  @provider = Provider.all()
  @fund = Fund.all()
  erb(:'transaction/show')
end

#SAVE
post '/transaction' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect ("/transaction")
end
