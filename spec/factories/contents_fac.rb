FactoryGirl.define do

  factory :content do
    title       { Faker::LeagueOfLegends.champion }
    short       { Faker::LeagueOfLegends.quote }
    body        { "<p>#{Faker::Lorem.paragraph}</p> <img src='#{Faker::LoremPixel.image("1336x384", false, 'technics')}' alt='0'>" }
    category    { Faker::LeagueOfLegends.location }
    slug        { }
    published_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    featured    { false }
    locale      { 'vi' }

    factory :about, class: About do
      main_image { Faker::LoremPixel.image("1336x384", false, 'people') }
    end

    factory :blog, class: Blog do
      main_image { Faker::LoremPixel.image("1336x384", false, 'business') }
    end

    factory :product, class: Product do
      main_image { Faker::LoremPixel.image("1336x384", false, 'nature') }
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
