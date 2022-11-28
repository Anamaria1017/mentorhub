# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Profile.destroy_all
User.destroy_all

puts "Creating mentee"

user = User.create!(email: "anita@hotmail.com", password: "Pedro1234")

mentee = Profile.create!(first_name: "Ana", last_name: "Castaneda",username: "Anita", mentor: false, city: "Berlin", highest_education: "Master",edu_organization: "ESMT",  working_experience: "3-5 years", position: "Studying", target_industry: "Consulting", preferred_language: "Spanish",   type_of_meeting: "online", user: user)

puts "Creating mentor"

user_2 = User.create!(email: "ulrich@hotmail.com", password: "Pedro1234")

mentor = Profile.create!(first_name: "Ulrich", last_name: "Meister",username: "Uli", mentor: true, position: "Senior Expert", city: "Berlin", highest_education: "Master", target_industry: "Consulting", mentor_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user_2)
