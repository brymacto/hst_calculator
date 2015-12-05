class ProductBundle
  attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def hst_applicable
    @product.hst_applicable
  end

  def subtotal
    @product.base_price * quantity
  end
end