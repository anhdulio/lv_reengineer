FactoryGirl.define do

  factory :price do
    updated_date  { Faker::Time.between(DateTime.now - 6, DateTime.now) }
    price { Faker::Number.number(3) }
    exchange_rate { Faker::Number.between(22600, 22800) }
    product
  end

end
