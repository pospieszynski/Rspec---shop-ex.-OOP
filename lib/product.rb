class Product

  attr_accessor :id, :name, :price

  @@id_max = 0 # automatically generate unique id
  def initialize name, price
    arguments_validation( name, price )
    @id = next_id
    @name = name
    @price = price
  end

  private

  def next_id
    @@id_max += 1
  end

  def arguments_validation name, price
    raise ArgumentError if name == nil || price == nil
    raise TypeError unless name.is_a?(String) && price.is_a?(Numeric)
  end
end


