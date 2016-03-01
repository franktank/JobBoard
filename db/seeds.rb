# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.where(name: "Web Development").first_or_create(name: "Web Development")
Category.where(name: "Designer").first_or_create(name: "Designer")
Category.where(name: "Finance").first_or_create(name: "Finance")
Category.where(name: "Engineering").first_or_create(name: "Engineering")
Category.where(name: "Human Resources").first_or_create(name: "Human Resources")


location = [
  "Buffalo, NY",
  "Tampa, FL",
  "New York City, NY",
  "Portland, OR",
  "Seattle, WA",
  "Los Angeles, CA",
  "Madison, WI"
]

User.where(email: "bob@test.com").first_or_create(email: "Bob Bobi", password: "password")

10.times do
  User.create(email: Faker::Internet.email, password: "password")
end

100.times do
  sleep 0.25
  Gig.create(name: Faker::Name.title, description: Faker::Lorem.paragraph(2), budget: rand(200..1000), location: location.sample, user_id:rand(1..10), category_id: rand(1..5) )

end
