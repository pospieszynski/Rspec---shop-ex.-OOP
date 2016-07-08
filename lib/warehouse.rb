class WareHouse

  attr_accessor :products

  def initialize products = []
    raise ArgumentError unless products.is_a?(Array)
    products.each { |product| raise ArgumentError unless product.is_a?(Product) }
    @products = products
  end

  def fetch name
    if product_index = available?(name)
      products.delete_at(product_index)
    end
  end

  def back product
    products << product
  end

  private
  def available? name
    unless name.nil?
      products.index { |a| a.name == name }
    end
  end
end