require_relative('../models/merchant')
# require_relative('../models/tag')
# require_relative('../models/transaction')
require ("pry")

#CLOTHING
merchant1 = Merchant.new({
  "name" => "ASOS"
  })

#TRANSPORT
merchant2 = Merchant.new({
  "name" => "Lothian Buses"
  })

#FOOD
merchant3 = Merchant.new ({
  "name" => "Wagamamas"
  })

##########################################

#CLOTHING
tag1 = Tag.new ({
  "category" => "Clothes"
  })

#TRANSPORT
tag2 = Tag.new ({
  "category" => "Travel"
  })

#FOOD
tag3 = Tag.new ({
  "category" => "Food"
  })

##########################################

#CLOTHING
transaction1 = Transaction.new ({
  "merchant_id" => merchant.id,
  "tag_id" => tag.id,
  "price" => 45.00
  })

#TRANSPORT
transaction2 = Transaction.new ({
  "merchant_id" => merchant.id,
  "tag_id" => tag.id,
  "price" => 60.00
  })

#FOOD
transaction3 = Transaction.new ({
  "merchant_id" => merchant.id,
  "tag_id" => tag.id,
  "price" => 16.00
  })

##########################################

merchant1.save()

binding.pry
nil
