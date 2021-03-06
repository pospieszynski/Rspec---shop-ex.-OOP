require_relative '../../lib/shop_basket.rb'
require_relative '../../lib/warehouse.rb'
require_relative '../../lib/product.rb'

RSpec.describe WareHouse do

  context "#initialize" do

    it "has an empty array of products by default when no array is passed to the constructor" do
      expect(WareHouse.new().products).to be_empty
    end

    it "has a table of products given in the constructor" do
      expect(WareHouse.new([Product.new("milk", 3)]).products.length).to eql(1)
    end

    it "raises an ArgumentError if the argument is not table of products " do
      expect { WareHouse.new([2]) }.to raise_error(ArgumentError)
    end
  end

  context "#back" do
    it "raises an ArgumentError if no argument is passed" do
      expect { WareHouse.new().back }.to raise_error(ArgumentError)
    end

    it "raises an TypeError if the argument is not a string" do
      expect { WareHouse.new().back }.to raise_error(ArgumentError)
    end

    it "put product back to the magazine" do
      shop_basket = ShopBasket.new(WareHouse.new([Product.new("milk", 25)]))
      shop_basket.add "milk"
      shop_basket.remove "milk"
      expect(shop_basket.warehouse.products.length).to eql(1)
    end

  end

  context "#fetch" do
    it "successfully deletes available product" do
      warehouse = WareHouse.new([Product.new("milk", 5)])
      warehouse.fetch("milk")
      expect(warehouse.products).to be_empty
    end

    it "returns nil if the product is not available" do
      warehouse = WareHouse.new([Product.new("milk", 5)])
      expect(warehouse.fetch("soap")).to eql(nil)
    end
  end
end