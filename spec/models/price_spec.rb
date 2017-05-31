require 'rails_helper'

RSpec.describe Price, type: :model do
  it 'has a positive integer value' do
    product = create(:product)
    price = build(:price, price: -12, product: product)
    expect(price.save).to be_falsey
  end
  it 'has a positive integer value' do
    product = create(:product)
    price = build(:price, exchange_rate: -12, product: product)
    expect(price.save).to be_falsey
  end
end