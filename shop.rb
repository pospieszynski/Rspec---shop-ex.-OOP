require_relative './lib/shop_basket.rb'
require_relative './lib/warehouse.rb'
require_relative './lib/product.rb'

def seed_products
  commodities = ["milk", "chocolate", "orange", "apple", "soap", "bread", "butter"]
  products = []
  commodities.size.times do |i|
    products << Product.new(commodities[i], rand(1..10))
  end
  products
end

basket = ShopBasket.new(WareHouse.new(seed_products))
basket.add "milk"; basket.add "bread"; basket.add "soap"
basket.remove("milk"); basket.remove("bread")
puts basket.receipt


