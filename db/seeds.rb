require_relative('../models/transaction.rb')
require_relative('../models/provider.rb')
require_relative('../models/fund.rb')
require ("pry")


Fund.delete_all()
Provider.delete_all()
Transaction.delete_all()

fund1 = Fund.new ({
  "category" => "Pension Portfolio 1"
  })
  fund1.save()

  fund2 = Fund.new ({
    "category" => "Pension Portfolio 2"
    })
  fund2.save()

  fund3 = Fund.new ({
    "category" => "Pension Portfolio 3"
    })
  fund3.save()

##########################################


provider1 = Provider.new({
  "name" => "Standard Life",
  "fund_id" => fund1.id
  })
  provider1.save()

provider2 = Provider.new({
  "name" => "Hangreaves Lansdown",
  "fund_id" => fund2.id
  })

provider2.save()

provider3 = Provider.new ({
  "name" => "Aegon",
  "fund_id" => fund3.id
  })
provider3.save()

Provider.all

##########################################

transaction1 = Transaction.new ({
  "provider_id" => provider1.id,
  "fund_id" => fund1.id,
  "price" => 45
  })

transaction2 = Transaction.new ({
  "provider_id" => provider2.id,
  "fund_id" => fund2.id,
  "price" => 60
  })

transaction3 = Transaction.new ({
  "provider_id" => provider3.id,
  "fund_id" => fund3.id,
  "price" => 16
  })

##########################################

transaction1.save()
transaction2.save()
transaction3.save()

binding.pry
nil
