class Product

  attr_accessor :id, :name, :price

  @@id_max = 0 # automatically generate unique id
  def initialize name, price
    raise ArgumentError if name == nil || price == nil
    raise TypeError unless name.is_a?(String) && price.is_a?(Numeric)
    @id = @@id_max += 1
    @name = name
    @price = price
  end
end