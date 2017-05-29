FactoryGirl.define do

  factory :about do
    title       { Faker::Name.name }
    short       { Faker::Lorem.sentence }
    body        { Faker::Lorem.sentence }
    category    { 'value' }
    locale      { 'vi' }
    slug        { Faker::Internet.slug(Faker::Name.name, '-') }
    published_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    featured    { true }
    main_image  { 'http://lorempixel.com/300/300/' }
  end

  factory :blog do
    title       { Faker::Name.name }
    short       { Faker::Lorem.sentence }
    body        { Faker::Lorem.sentence }
    category    { 'value' }
    locale      { 'vi' }
    slug        { Faker::Internet.slug(Faker::Name.name, '-') }
    published_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    featured    { true }
    main_image  { 'http://lorempixel.com/300/300/' }
  end

end
