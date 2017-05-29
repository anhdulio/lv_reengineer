FactoryGirl.define do

  factory :price do
    updated_date   { Faker::Time.between(DateTime.now - 6, DateTime.now) }
    price  { Faker::Number.number(3) }
    product
  end

  factory :product do
    title       { Faker::Name.name }
    short       { Faker::Lorem.sentence }
    main_image  { 'http://lorempixel.com/300/300/' }
    featured    { true }
    body        { Faker::Lorem.sentence }

    factory :product_with_prices do
      transient do
        prices_count 3
      end

      after(:create) do |product, evaluator|
        create_list(:price, evaluator.prices_count, product: product)
      end
    end

  end


end