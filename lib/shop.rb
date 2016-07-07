require_relative './shop_basket.rb'
require_relative './warehouse.rb'
require_relative './product.rb'

def seed_products
  commodities = ["milk", "chocolate", "orange", "apple", "soap", "bread", "butter"]
  products = []
  commodities.size.times do |i|
    products << Product.new( commodities[i], rand(1..10) )
  end
  products
end

basket = ShopBasket.new( WareHouse.new( seed_products ) )
basket.add "milk"; basket.add "bread"; basket.add "soap" 
basket.remove("milk"); basket.remove("bread") 
puts basket.receipt


