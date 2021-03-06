# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.find_or_create_by!(
  first_name: "Joe",
  last_name:  "O'Brien",
  username: "objo",
  bio: "Lorem ipsum dolnthor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  city: "Westerville", 
  state: "Ohio",
)

u.tweets.destroy_all

source = [ Faker::Seinfeld, Faker::SiliconValley, Faker::StarWars, Faker::HarryPotter ]

puts "Creating tweets"
20.times do 
  putc '.'
  u.tweets.create!(
    message: source.sample.quote, 
    created_at: Faker::Date.between(2.months.ago, Time.now)
  )
end

puts "done"








