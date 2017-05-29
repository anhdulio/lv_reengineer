require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    product = create(:product_with_prices)
    expect(product).to be_valid
    expect(product.prices.size).to eq(3)
  end
end
