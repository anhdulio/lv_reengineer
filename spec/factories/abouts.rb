FactoryGirl.define do
  factory :about do
    title       { Faker::Name.name }
    body        { Faker::Lorem.sentence }
    category    { 'value' }
    locale      { 'vi' }
    slug        { Faker::Internet.slug(Faker::Name.name, '-') }
    published_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end