class ShopBasket

  attr_accessor :basket, :warehouse

  def initialize warehouse
    raise ArgumentError if warehouse == nil
    @warehouse = warehouse
    @basket = []
  end

  def add name
    raise TypeError unless name.is_a?(String)
    product = warehouse.fetch name
    (product) ? basket <<(product) : basket # if product exist add it to the basket
  end

  def remove name
    raise TypeError unless name.is_a?(String)
    index = basket.index { |x| x.name == name }
    if index
      warehouse.back name
      basket.delete_at(index)
    end
  end

  def price_gross
    price_net * 1.23
  end

  def price_net
    basket.reduce(0) { |sum, n| sum + n.price }
  end

  def receipt
    receipt = "\n*******************"
    receipt += "\n*BIEDRONKA*"
    receipt += "\n*******************"

    unique = basket.group_by { |product| product.name }

    unique.each do |k, v|
      receipt += "\n #{k} -- #{v.count} szt.---  #{v.first.price} zł\n"
    end
    receipt += "\n*******************"
    receipt += "\nTotal brutto --> #{price_gross} zł \n"
    receipt += "\nTotal netto --> #{price_net} zł\n"
    receipt += "\n===================\n\n"
    receipt += "\nThank you for shopping, see you soon!"
    receipt
  end
end