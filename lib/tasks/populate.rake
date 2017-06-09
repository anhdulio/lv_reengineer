require 'factory_girl'
require 'faker'

namespace :db do
  desc "Populate the database with some sample data"
  task :populate, [:count] => [:environment] do |t, args|
    args.with_defaults(:count => 10)
    puts "Resetting the database"
    Rake::Task['db:reset'].invoke
    puts "Creating #{args[:count]} blogs"
    blogs = FactoryGirl.create_list(:blog, args[:count].to_i)
    puts "Creating featured blogs"
    blogs = FactoryGirl.create(:blog, featured: true)
    puts "Creating #{args[:count]} abouts"
    abouts = FactoryGirl.create_list(:about, args[:count].to_i)
    puts "Creating featured abouts"
    abouts = FactoryGirl.create(:about, featured: true)
    puts "Creating a product with prices"
    products = FactoryGirl.create_list(:product_with_prices, args[:count].to_i)
    puts "Creating featured products"
    abouts = FactoryGirl.create(:product_with_prices, featured: true)
    puts "Done!"
  end
end

['db:drop', 'db:reset', 'db:seed', 'db:populate'].each do |t|
  Rake::Task[t].enhance ['skip_prod']
end