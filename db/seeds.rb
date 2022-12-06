# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Like.destroy_all
Chatroom.destroy_all
Match.destroy_all
Profile.destroy_all
User.destroy_all

puts "Creating mentees"

user = User.create!(email: "anita@hotmail.com", password: "Pedro1234", mentor: false)

mentee = Profile.create!(first_name: "Ana", last_name: "Castaneda", username: "Anita", city: "Berlin", highest_education: "Master", edu_organization: "ESMT",  working_experience: "3-5 years", position: "Senior Consultant", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user)

user_erick = User.create!(email: "erick@hotmail.com", password: "Pedro1234", mentor: false)

mentee_erick = Profile.create!(first_name: "Erick", last_name: "Gonzales", username: "Erick", city: "Berlin", highest_education: "PhD", edu_organization: "ESMT",  working_experience: "3-5 years", position: "Senior Consultant", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user_erick)

user_chloe = User.create!(email: "chloe@hotmail.com", password: "Pedro1234", mentor: false)

mentee_chloe = Profile.create!(first_name: "Chloe", last_name: "Bowers", username: "Chlo", city: "Frankfurt", highest_education: "Master", edu_organization: "ESMT",  working_experience: "1-2 years", position: "Associate", target_industry: "Education Management", preferred_language: "German", type_of_meeting: "online", user: user_chloe)

user_nicola = User.create!(email: "nicola@hotmail.com", password: "Pedro1234", mentor: false)

mentee_nicola = Profile.create!(first_name: "Nicola", last_name: "Hoffman", username: "Nico", city: "Frankfurt", highest_education: "PhD", edu_organization: "ESMT",  working_experience: "4-5 years", position: "Associate", target_industry: "Education Management", preferred_language: "English", type_of_meeting: "online", user: user_nicola)

user_kate = User.create!(email: "kate@hotmail.com", password: "Pedro1234", mentor: false)

mentee_kate = Profile.create!(first_name: "Kate", last_name: "Middleton", username: "Kate", city: "Hamburg", highest_education: "High School", edu_organization: "Cambridge",  working_experience: "1-2 years", position: "Partner", target_industry: "Health", preferred_language: "English", type_of_meeting: "online", user: user_kate)

user_harry = User.create!(email: "harry@hotmail.com", password: "Pedro1234", mentor: false)

mentee_harry = Profile.create!(first_name: "Harry", last_name: "Prince", username: "Harry", city: "Munich", highest_education: "Bachelor", edu_organization: "Oxford",  working_experience: "4-5 years", position: "Associate", target_industry: "Hospitality", preferred_language: "German", type_of_meeting: "online", user: user_harry)

user_winnie = User.create!(email: "winnie@hotmail.com", password: "Pedro1234", mentor: false)

mentee_winnie = Profile.create!(first_name: "Winnie", last_name: "Bengal", username: "Winnie", city: "Berlin", highest_education: "High School", edu_organization: "ESMT",  working_experience: "0 years", position: "nil", target_industry: "Entertainment", preferred_language: "English", type_of_meeting: "online", user: user_winnie)

user_isabelle = User.create!(email: "izzy@hotmail.com", password: "Pedro1234", mentor: false)

mentee_isabelle = Profile.create!(first_name: "Isabelle", last_name: "Black", username: "Izzy", city: "Hamburg", highest_education: "Bachelor", edu_organization: "ESMT",  working_experience: "4-5 years", position: "Intern", target_industry: "Business", preferred_language: "English", type_of_meeting: "online", user: user_isabelle)

puts "Creating mentors"

user = User.create!(email: "ulrich@hotmail.com", password: "Pedro1234", mentor: true)

mentor = Profile.create!(first_name: "Ulrich", last_name: "Meister", username: "Uli", position: "Managing Principal", city: "Berlin", highest_education: "Master", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user)

user_sandra = User.create!(email: "sandra@hotmail.com", password: "Pedro1234", mentor: true)

mentor_sandra = Profile.create!(first_name: "Sandra", last_name: "Müller", username: "Sandi", position: "Partner", city: "Frankfurt", highest_education: "Master", target_industry: "Education Management", preferred_language: "German", type_of_meeting: "online", user: user_sandra)

user_john = User.create!(email: "john@hotmail.com", password: "Pedro1234", mentor: true)

mentor_john = Profile.create!(first_name: "John", last_name: "Smith", username: "John", position: "Partner", city: "Hamburg", highest_education: "Highschool", target_industry: "Education Management", preferred_language: "English", type_of_meeting: "online", user: user_john)

user_elizabeth = User.create!(email: "elizabeth@hotmail.com", password: "Pedro1234", mentor: true)

mentor_elizabeth = Profile.create!(first_name: "Elizabeth", last_name: "King", username: "Lizzie", position: "Associate", city: "Berlin", highest_education: "Bachelor", target_industry: "Public Sector", preferred_language: "German", type_of_meeting: "online", user: user_elizabeth)

user_william = User.create!(email: "william@hotmail.com", password: "Pedro1234", mentor: true)

mentor_william = Profile.create!(first_name: "William", last_name: "Jones", username: "Will", position: "Partner", city: "Frankfurt", highest_education: "PHD", target_industry: "Health", preferred_language: "English", type_of_meeting: "online", user: user_william)

user_jennifer = User.create!(email: "jennifer@hotmail.com", password: "Pedro1234", mentor: true)

mentor_jennifer = Profile.create!(first_name: "Jennifer", last_name: "Lopez", username: "Jennifer", position: "Consultant", city: "Berlin", highest_education: "High School", target_industry: "Public Sector", preferred_language: "Spanish", type_of_meeting: "online", user: user_jennifer)
# unmatch_52 = Match.create!(mentor_id: mentor.id, mentee_id: mentee.id, match: false)

puts "Creating match!"

# chatroom_1 = Chatroom.create!(match_id: match_1.id)

puts "Creating meeting!"
