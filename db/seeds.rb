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

puts "Creating mentees"

user = User.create!(email: "anita@hotmail.com", password: "Pedro1234")

mentee = Profile.create!(first_name: "Ana", last_name: "Castaneda", username: "Anita", mentor: false, city: "Berlin", highest_education: "Master", edu_organization: "ESMT",  working_experience: "3-5 years", position: "Senior Consultant", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user)

user_erick = User.create!(email: "erick@hotmail.com", password: "Pedro1234")

mentee_erick = Profile.create!(first_name: "Erick", last_name: "Gonzales", username: "Erick", mentor: false, city: "Berlin", highest_education: "PhD", edu_organization: "ESMT",  working_experience: "3-5 years", position: "Senior Consultant", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user_erick)

user_chloe = User.create!(email: "chloe@hotmail.com", password: "Pedro1234")

mentee_chloe = Profile.create!(first_name: "Chloe", last_name: "Bowers", username: "Chlo", mentor: false, city: "Frankfurt", highest_education: "Master", edu_organization: "ESMT",  working_experience: "1-2 years", position: "Associate", target_industry: "Education", preferred_language: "German", type_of_meeting: "online", user: user_chloe)

user_nicola = User.create!(email: "nicola@hotmail.com", password: "Pedro1234")

mentee_nicola = Profile.create!(first_name: "Nicola", last_name: "Hoffman", username: "Nico", mentor: false, city: "Frankfurt", highest_education: "PhD", edu_organization: "ESMT",  working_experience: "4-5 years", position: "Associate", target_industry: "Education", preferred_language: "Managing Principal", type_of_meeting: "online", user: user_nicola)

puts "Creating mentors"

user = User.create!(email: "ulrich@hotmail.com", password: "Pedro1234")

mentor = Profile.create!(first_name: "Ulrich", last_name: "Meister", username: "Uli", mentor: true, position: "Managing Principal", city: "Berlin", highest_education: "Master", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user)

user_sandra = User.create!(email: "sandra@hotmail.com", password: "Pedro1234")

mentor = Profile.create!(first_name: "Sandra", last_name: "Müller", username: "Sandi", mentor: true, position: "Partner", city: "Frankfurt", highest_education: "Master", target_industry: "Education", preferred_language: "German", type_of_meeting: "online", user: user_sandra)

match_1 = Match.create!(mentor_id: mentor.id, mentee_id: mentee.id)

puts "Creating match!"

chatroom_1 = Chatroom.create!(match_id: match_1.id)
