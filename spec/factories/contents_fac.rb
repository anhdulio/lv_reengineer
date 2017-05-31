FactoryGirl.define do

  factory :content do
    title       { Faker::Name.name }
    short       { Faker::Lorem.sentence }
    body        { Faker::Lorem.sentence }
    category    { Faker::Ancient.god }
    slug        { Faker::Internet.slug(Faker::Name.name, '-') }
    published_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    featured    { false }
    locale      { 'vi' }

    factory :about, class: About do
      main_image { Faker::LoremPixel.image("1024x384", false, 'people') }
    end

    factory :blog, class: Blog do
      main_image { Faker::LoremPixel.image("1024x384", false, 'business') }
    end

    factory :product, class: Product do
      main_image { Faker::LoremPixel.image("1024x384", false, 'nature') }
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

end
