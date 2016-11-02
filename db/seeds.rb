# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

# User.create!(name:  "Example User",
#              email: "example@gmail.com",
#              password:              "password",
#              password_confirmation: "password")
100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name, email: email, password: password, password_confirmation: password)
end

users = User.order(:created_at).take(6)
30.times do
  picture = "This is where the image link will go."
  caption = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(picture: picture, caption: caption) }
end
