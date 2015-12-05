require 'spec_helper'
require_relative '../price_calculator'
require_relative '../product_bundle'
require_relative '../product'

describe PriceCalculator do
  it 'returns subtotal if HST is not applicable' do
    product = Product.new('apples', 1.00, false)
    product_bundle = ProductBundle.new(product, 10)
    price_calculator = PriceCalculator.new(hst_rate: 0.13, product_bundles: [product_bundle])

    total_price = price_calculator.total_price

    expect(total_price).to eq(10.00)
  end

  it 'returns total including HST when applicable' do
    product = Product.new('TV', 400.00, true)
    product_bundle = ProductBundle.new(product, 1)
    price_calculator = PriceCalculator.new(hst_rate: 0.13, product_bundles: [product_bundle])

    total_price = price_calculator.total_price

    expect(total_price).to eq(452.00)
  end
end
