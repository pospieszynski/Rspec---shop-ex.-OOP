require_relative '../../lib/shop_basket.rb'
require_relative '../../lib/warehouse.rb'
require_relative '../../lib/product.rb'

RSpec.describe ShopBasket do

  context "#initialize" do
    it "raises an ArgumentError when warehouse is not provided" do
      expect {
        ShopBasket.new(nil)
      }.to raise_error(ArgumentError)
    end
  end

  context "#add" do
    it "raises a TypeError when name is not a string" do
      expect {
        ShopBasket.new(WareHouse.new()).add 122
      }.to raise_error(TypeError)
    end

    it "doesn't add product to the basket if one is not available in the warehouse" do
      shop_basket = ShopBasket.new(WareHouse.new())
      shop_basket.add "milk"
      expect(shop_basket.basket).to be_empty
    end

    it "adds product to the basket if one is available in the warehouse" do
      shop_basket = ShopBasket.new(WareHouse.new([Product.new("milk", 25)]))
      shop_basket.add "milk"
      expect(shop_basket.basket).not_to be_empty
    end
  end

  context "#remove" do
    it "raises an error if the parameter is not a string" do
      expect {
        ShopBasket.new(WareHouse.new()).add 122
      }.to raise_error(TypeError)
    end

    it "doesn't remove anything if there is no requested thing to remove in a basket" do
      shop_basket = ShopBasket.new(WareHouse.new([Product.new("milk", 25)]))
      shop_basket.add "milk"
      shop_basket.remove "soap"
      expect(shop_basket.basket.length).to be(1)
    end

    it "removes the product from the basket" do
      shop_basket = ShopBasket.new(WareHouse.new([Product.new("milk", 25)]))
      shop_basket.add "milk"
      shop_basket.remove "milk"
      expect(shop_basket.basket.length).to be(0)
    end
  end

  context "#price_gross" do
    it "returns proper price brutto" do
      shop_basket = ShopBasket.new(WareHouse.new([Product.new("milk", 5)]))
      shop_basket.add "milk"
      expect(shop_basket.price_gross).to eql(6.15)
    end
  end

  context "#price_net" do
    it "return proper price netto" do
      shop_basket = ShopBasket.new(WareHouse.new([Product.new("milk", 5), Product.new("bread", 2)]))
      shop_basket.add "milk"
      shop_basket.add "bread"
      expect(shop_basket.price_net).to eql(7)
    end
  end

  context "#receipt" do
    it "prints proper receipt" do
      basket = ShopBasket.new(WareHouse.new([Product.new("milk", 2), Product.new("bread", 2), Product.new("soap", 3)]))
      basket.add "milk"; basket.add "bread"; basket.add "soap"
      basket.remove("milk"); basket.remove("bread")
      expect(basket.receipt).to eql("\n*******************\n*BIEDRONKA*\n*******************\n soap -- 1 szt.---  3 zł\n\n*******************\nTotal brutto --> 3.69 zł \n\nTotal netto --> 3 zł\n\n===================\n\n\nThank you for shopping, see you soon!")
    end
  end
end