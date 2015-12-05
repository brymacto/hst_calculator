class Product
  attr_reader :name, :base_price, :hst_applicable

  def initialize(name, base_price, hst_applicable)
    @name = name
    @base_price = base_price.to_f
    @hst_applicable = hst_applicable
  end
end
