class PriceCalculator

  attr_accessor :hst_rate, :product_bundles

  def initialize(calculator_args)
    @hst_rate = calculator_args[:hst_rate] || 0.13
    @product_bundles = calculator_args[:product_bundles] || []
  end

  def total_price
    subtotal_amount + hst_amount
  end

  def add_product_bundle(product_bundle)
    @product_bundles << product_bundle
  end

  private

  def subtotal_amount
    @product_bundles.inject(0) { |subtotals, product_bundle |
      subtotals + product_bundle.subtotal
    }
  end

  def hst_amount
    hst_amount = 0.00
    @product_bundles.each do |product_bundle|
      hst_amount += (product_bundle.quantity * @hst_rate) if product_bundle.hst_applicable
    end
    hst_amount
  end
end


