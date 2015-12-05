class PriceCalculator
  attr_accessor :hst_rate, :product_bundles

  def initialize(calculator_args)
    @hst_rate = calculator_args[:hst_rate] || 0.13
    @product_bundles = calculator_args[:product_bundles] || []
  end

  def total_price
    (subtotal_amount * (1.00 + hst_amount)).round(2)
  end

  def add_product_bundle(product_bundle)
    @product_bundles << product_bundle
  end

  private

  def subtotal_amount
    @product_bundles.inject(0) do |subtotals, product_bundle|
      subtotals + product_bundle.subtotal
    end
  end

  def hst_amount
    @product_bundles.inject(0) do |hst_amounts, product_bundle|
      if product_bundle.hst_applicable
        hst_amounts + (product_bundle.quantity * @hst_rate)
      else
        hst_amounts
      end
    end
  end
end
