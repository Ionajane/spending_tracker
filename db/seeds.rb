require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require ("pry")

# Merchant.delete_all()
# Tag.delete_all()
# Transaction.delete_all()

#CLOTHING
merchant1 = Merchant.new({
  "name" => "ASOS"
  })

merchant1.save()

#TRANSPORT
merchant2 = Merchant.new({
  "name" => "Lothian Buses"
  })

merchant2.save()

#FOOD
merchant3 = Merchant.new ({
  "name" => "Wagamamas"
  })

merchant3.save()

##########################################

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
transaction1 = Transaction.new ({
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "price" => 45.00
  })

#TRANSPORT
transaction2 = Transaction.new ({
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "price" => 60.00
  })

#FOOD
transaction3 = Transaction.new ({
  "merchant_id" => merchant3.id,
  "tag_id" => tag3.id,
  "price" => 16.00
  })

##########################################

transaction1.save()
transaction2.save()
transaction3.save()




binding.pry
nil
