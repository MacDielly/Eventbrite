# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do |i|
  first_name = Faker::Name.first_name
  User.create(
    first_name:first_name,
    email:"#{first_name}@yopmail.com",
    password:"azerty",
    password_confirmation:"azerty"
  )
  puts "#{i+1} User(s) create"
end

10.times do |i|
  Event.create(
    start_date:Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    duration:rand(1..10)*5,
    title:Faker::Game.title,
    description:Faker::Lorem.paragraph,
    price:rand(5..20),
    location:Faker::Address.city
  )
  puts "#{i+1} Event(s) create"
end

20.times do |i|
  Attendance.create(
    stripe_customer_id:Faker::Lorem.word,
    user_id:User.all.sample.id,
    event_id:Event.all.sample.id
  )
  puts "#{i+1} Attendance(s) create"
end