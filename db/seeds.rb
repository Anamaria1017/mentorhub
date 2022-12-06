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

mentee_nicola = Profile.create!(first_name: "Nicola", last_name: "Hoffman", username: "Nico", city: "Frankfurt", highest_education: "PhD", edu_organization: "ESMT",  working_experience: "4-5 years", position: "Associate", target_industry: "Education Management", preferred_language: "German", type_of_meeting: "online", user: user_nicola)

user_hans = User.create!(email: "paul@hotmail.com", password: "Pedro1234", mentor: false)

mentee_hans = Profile.create!(first_name: "Hans", last_name: "Meyer", username: "Hans", city: "München", highest_education: "High School",  working_experience: "3-5 years", position: "Associate", target_industry: "Hospitality", preferred_language: "German", type_of_meeting: "online", user: user_paul)

user_maria = User.create!(email: "maria@hotmail.com", password: "Pedro1234", mentor: false)

mentee_maria = Profile.create!(first_name: "Maria", last_name: "Schmidt", username: "Marie", city: "München", highest_education: "Bachelor", edu_organization: "Berlin TU",  working_experience: "3-5 years", position: "Associate", target_industry: "Hospitality", preferred_language: "German", type_of_meeting: "online", user: user_maria)

user_steffanie = User.create!(email: "steffanie@hotmail.com", password: "Pedro1234", mentor: false)

mentee_steffanie = Profile.create!(first_name: "Steffanie", last_name: "Kluge", username: "Steffi", city: "München", highest_education: "Bachelor", edu_organization: "Maximilians Universität",  working_experience: "1-2 years", position: "Associate", target_industry: "Hospitality", preferred_language: "German", type_of_meeting: "online", user: user_steffanie)

user_anne = User.create!(email: "anne@hotmail.com", password: "Pedro1234", mentor: false)

mentee_anne = Profile.create!(first_name: "Anne", last_name: "Jansen", username: "Anne", city: "Hamburg", highest_education: "Bachelor", edu_organization: "HafenCity Universität",  working_experience: "3-5 years", position: "Associate", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_anne)

user_paul = User.create!(email: "paul@hotmail.com", password: "Pedro1234", mentor: false)

mentee_paul = Profile.create!(first_name: "Paul", last_name: "Hansen", username: "Paul", city: "Hamburg", highest_education: "Bachelor", edu_organization: "HafenCity Universität",  working_experience: "3-5 years", position: "Associate", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_paul)

user_max = User.create!(email: "max@hotmail.com", password: "Pedro1234", mentor: false)

mentee_max = Profile.create!(first_name: "Max", last_name: "Bauer", username: "Max", city: "Hamburg", highest_education: "Bachelor", edu_organization: "Berlin TU",  working_experience: "1-2 years", position: "Associate", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_max)

user_grace = User.create!(email: "grace@hotmail.com", password: "Pedro1234", mentor: false)

mentee_grace = Profile.create!(first_name: "Grace", last_name: "Walker", username: "Grace", city: "Hamburg", highest_education: "Master", edu_organization: "Berlin TU",  working_experience: "3-5 years", position: "Senior Consultant", target_industry: "Architecture & Planning", preferred_language: "English", type_of_meeting: "online", user: user_grace)

user_john = User.create!(email: "john@hotmail.com", password: "Pedro1234", mentor: false)

mentee_john = Profile.create!(first_name: "John", last_name: "Smith", username: "John", city: "Berlin", highest_education: "Bachelor", edu_organization: "Berlin TU",  working_experience: "1-2 years", position: "Associate", target_industry: "Consulting", preferred_language: "English", type_of_meeting: "online", user: user_john)

user_stella = User.create!(email: "stella@hotmail.com", password: "Pedro1234", mentor: false)

mentee_stella = Profile.create!(first_name: "Stella", last_name: "Dubilier", username: "Stella", city: "Berlin", highest_education: "Bachelor", edu_organization: "Universität der Künste Berlin",  working_experience: "3-5 years", position: "Freelancer", target_industry: "Design", preferred_language: "English", type_of_meeting: "online", user: user_stella)

user_detlef = User.create!(email: "detlef@hotmail.com", password: "Pedro1234", mentor: false)

mentee_detlef = Profile.create!(first_name: "Detlef", last_name: "Hauser", username: "Didi", city: "Berlin", highest_education: "Bachelor", edu_organization: "Universität der Künste Berlin",  working_experience: "1-2 years", position: "Freelancer", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_detlef)

user_friedrich = User.create!(email: "friedrich@hotmail.com", password: "Pedro1234", mentor: false)

mentee_friedrich = Profile.create!(first_name: "Friedrich", last_name: "Appels", username: "Fritz", city: "Hamburg", highest_education: "Bachelor", edu_organization: "HAW Hamburg",  working_experience: "3-5 years", position: "Associate", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_friedrich)

user_clara = User.create!(email: "clara@hotmail.com", password: "Pedro1234", mentor: false)

mentee_clara = Profile.create!(first_name: "Clara", last_name: "Schulze", username: "Clara", city: "Berlin", highest_education: "Bachelor", edu_organization: "Universität der Künste Berlin",  working_experience: "3-5 years", position: "Freelancer", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_clara)

user_sunny = User.create!(email: "sunny@hotmail.com", password: "Pedro1234", mentor: false)

mentee_sunny = Profile.create!(first_name: "Sunny", last_name: "Bremer", username: "Sunny", city: "Berlin", highest_education: "Bachelor", edu_organization: "HAW Hamburg",  working_experience: "1-2 years", position: "Associate", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_sunny)

puts "Creating mentors"

user = User.create!(email: "ulrich@hotmail.com", password: "Pedro1234", mentor: true)

mentor = Profile.create!(first_name: "Ulrich", last_name: "Meister", username: "Uli", position: "Managing Principal", city: "Berlin", highest_education: "Master", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user)

user_sandra = User.create!(email: "sandra@hotmail.com", password: "Pedro1234", mentor: true)

mentor_sandra = Profile.create!(first_name: "Sandra", last_name: "Müller", username: "Sandi", position: "Partner", city: "Frankfurt", highest_education: "Master", target_industry: "Education Management", preferred_language: "German", type_of_meeting: "online", user: user_sandra)

user_robert = User.create!(email: "robert@hotmail.com", password: "Pedro1234", mentor: true)

mentor_robert = Profile.create!(first_name: "Robert", last_name: "Harre", username: "Robert", position: "Partner", city: "Hamburg", highest_education: "Master", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_robert)

user_sophie = User.create!(email: "sophie@hotmail.com", password: "Pedro1234", mentor: true)

mentor_sophie = Profile.create!(first_name: "Sophie", last_name: "Stadler", username: "Sophie", position: "Managing Director", city: "München", highest_education: "Master", target_industry: "Hospitality", preferred_language: "German", type_of_meeting: "online", user: user_sophie)

user_stefan = User.create!(email: "stefan@hotmail.com", password: "Pedro1234", mentor: true)

mentor_stefan = Profile.create!(first_name: "Stefan", last_name: "Steinkamp", username: "Stefan", position: "Partner", city: "Berlin", highest_education: "Phd", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user_stefan)

user_birgit = User.create!(email: "birgit@hotmail.com", password: "Pedro1234", mentor: true)

mentor_birgit = Profile.create!(first_name: "Birgit", last_name: "Gockel", username: "Birgit", position: "Partner", city: "Berlin", highest_education: "Master", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_birgit)

user_lars = User.create!(email: "lars@hotmail.com", password: "Pedro1234", mentor: true)

mentor_lars = Profile.create!(first_name: "Lars", last_name: "Johanson", username: "Lars", position: "Partner", city: "Hamburg", highest_education: "Master", target_industry: "Design", preferred_language: "English", type_of_meeting: "online", user: user_lars)

# unmatch_52 = Match.create!(mentor_id: mentor.id, mentee_id: mentee.id, match: false)

puts "Creating match!"

# chatroom_1 = Chatroom.create!(match_id: match_1.id)

puts "Creating meeting!"
