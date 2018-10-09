require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require ("pry")

Merchant.all

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()

#CLOTHING
tag1 = Tag.new ({
  "category" => "Clothes"
  })

  tag1.save()

  #TRANSPORT
  tag2 = Tag.new ({
    "category" => "Travel"
    })

  tag2.save()

  #FOOD
  tag3 = Tag.new ({
    "category" => "Food"
    })

  tag3.save()

##########################################

#CLOTHING
merchant1 = Merchant.new({
  "name" => "ASOS",
  "tag_id" => tag1.id
  })

merchant1.save()

#TRANSPORT
merchant2 = Merchant.new({
  "name" => "Lothian Buses",
  "tag_id" => tag2.id
  })

merchant2.save()

#FOOD
merchant3 = Merchant.new ({
  "name" => "Wagamamas",
  "tag_id" => tag3.id
  })

merchant3.save()

##########################################

#CLOTHING
transaction1 = Transaction.new ({
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "price" => 45
  })

#TRANSPORT
transaction2 = Transaction.new ({
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "price" => 60
  })

#FOOD
transaction3 = Transaction.new ({
  "merchant_id" => merchant3.id,
  "tag_id" => tag3.id,
  "price" => 16
  })

##########################################

transaction1.save()
transaction2.save()
transaction3.save()

binding.pry
nil
