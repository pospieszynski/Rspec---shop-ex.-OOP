require_relative '../../lib/product.rb'

RSpec.describe Product do

  context "#initialize" do

    it "raises an ArgumentError when two arguments are not provided" do
      expect {
        Product.new(nil, nil)
      }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when price is not provided" do
      expect {
        Product.new("milk", nil)
      }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when name is not provided" do
      expect {
        Product.new(nil, 12)
      }.to raise_error(ArgumentError)
    end

    it "raises a TypeError when price is not of numeric type" do
      expect {
        Product.new("milk", "12.5")
      }.to raise_error(TypeError)
    end

    it "raises a TypeError when name is not a string" do
      expect {
        Product.new(12, 12)
      }.to raise_error(TypeError)
    end

    it "raises a TypeError when both arguments are of improper type" do
      expect {
        Product.new(12, "milk")
      }.to raise_error(TypeError)
    end

    it "it throws a NoMethodError when trying to access class attribute" do
      expect {
        Product.id_max
      }.to raise_error(NoMethodError)
    end
  end
end