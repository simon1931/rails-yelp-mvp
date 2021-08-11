# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'Clearing database'
Restaurant.destroy_all

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
  )
  restaurant.save!
  puts 'Restaurant created'
  5.times do
    review = Review.new(
      restaurant: restaurant,
      content: Faker::Lorem.sentence,
      rating: (rand() * 5).to_i
    )
    puts "."
    review.save!
  end
end

puts 'Finished!'
