require "down"
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Like.destroy_all
Chatroom.destroy_all
Match.destroy_all
Profile.destroy_all
User.destroy_all

puts "Creating mentees"

user = User.create!(email: "anita@hotmail.com", password: "Pedro1234", mentor: false)
mentee = Profile.create!(first_name: "Ana", last_name: "Castaneda", username: "Anita", city: "Berlin", highest_education: "Master", edu_organization: "ESMT",  working_experience: "3-5 years", position: "Associate", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670489284/2020_CV_Foto_d64gfo.jpg")
mentee.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_erick = User.create!(email: "erick@hotmail.com", password: "Pedro1234", mentor: false)
mentee_erick = Profile.create!(first_name: "Erick", last_name: "Gonzales", username: "Erick", city: "Berlin", highest_education: "PhD", edu_organization: "ESMT",  working_experience: "3-5 years", position: "Senior Consultant", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user_erick)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1669387166/dgg4c14fl4c6jy2bhntob3rl9ohr.jpg")
mentee_erick.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_nicola = User.create!(email: "nicola@hotmail.com", password: "Pedro1234", mentor: false)
mentee_nicola = Profile.create!(first_name: "Nicola", last_name: "Hoffman", username: "Nico", city: "Frankfurt", highest_education: "PhD", edu_organization: "ESMT",  working_experience: "4-5 years", position: "Associate", target_industry: "Education Management", preferred_language: "German", type_of_meeting: "online", user: user_nicola)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670345947/nicola_xkgkva.jpg")
mentee_nicola.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_hans = User.create!(email: "hans@hotmail.com", password: "Pedro1234", mentor: false)
mentee_hans = Profile.create!(first_name: "Hans", last_name: "Meyer", username: "Hans", city: "M??nchen", highest_education: "High School",  working_experience: "3-5 years", position: "Associate", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user_hans)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670345937/hans_fwfr1r.jpg")
mentee_hans.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_maria = User.create!(email: "maria@hotmail.com", password: "Pedro1234", mentor: false)
mentee_maria = Profile.create!(first_name: "Maria", last_name: "Schmidt", username: "Maria", city: "M??nchen", highest_education: "Bachelor", edu_organization: "Berlin TU",  working_experience: "3-5 years", position: "Consultant", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user_maria)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670345939/maria_sb9kab.jpg")
mentee_maria.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_steffanie = User.create!(email: "steffanie@hotmail.com", password: "Pedro1234", mentor: false)
mentee_steffanie = Profile.create!(first_name: "Steffanie", last_name: "Kluge", username: "Steffi", city: "M??nchen", highest_education: "Bachelor", edu_organization: "Maximilians Universit??t",  working_experience: "1-2 years", position: "Consultant", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user_steffanie)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670345950/steffanie_lawtj5.webp")
mentee_steffanie.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_anne = User.create!(email: "anne@hotmail.com", password: "Pedro1234", mentor: false)
mentee_anne = Profile.create!(first_name: "Anne", last_name: "Jansen", username: "Anne", city: "Hamburg", highest_education: "Bachelor", edu_organization: "HafenCity Universit??t",  working_experience: "3-5 years", position: "Associate", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_anne)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670345915/anne_t7xui4.jpg")
mentee_anne.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_paul = User.create!(email: "paul@hotmail.com", password: "Pedro1234", mentor: false)
mentee_paul = Profile.create!(first_name: "Paul", last_name: "Hansen", username: "Paul", city: "Hamburg", highest_education: "Bachelor", edu_organization: "HafenCity Universit??t",  working_experience: "3-5 years", position: "Associate", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_paul)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670423380/paul_qf0bem.jpg")
mentee_paul.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_max = User.create!(email: "max@hotmail.com", password: "Pedro1234", mentor: false)
mentee_max = Profile.create!(first_name: "Max", last_name: "Bauer", username: "Max", city: "Hamburg", highest_education: "Bachelor", edu_organization: "Berlin TU",  working_experience: "1-2 years", position: "Associate", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_max)

user_grace = User.create!(email: "grace@hotmail.com", password: "Pedro1234", mentor: false)
mentee_grace = Profile.create!(first_name: "Grace", last_name: "Walker", username: "Grace", city: "Hamburg", highest_education: "Master", edu_organization: "Berlin TU",  working_experience: "3-5 years", position: "Senior Consultant", target_industry: "Architecture & Planning", preferred_language: "English", type_of_meeting: "online", user: user_grace)

user_john = User.create!(email: "john@hotmail.com", password: "Pedro1234", mentor: false)
mentee_john = Profile.create!(first_name: "John", last_name: "Smith", username: "John", city: "Berlin", highest_education: "Bachelor", edu_organization: "Berlin TU",  working_experience: "1-2 years", position: "Associate", target_industry: "Consulting", preferred_language: "English", type_of_meeting: "online", user: user_john)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670357683/hans_xoemjg.jpg")
mentee_john.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_stella = User.create!(email: "stella@hotmail.com", password: "Pedro1234", mentor: false)
mentee_stella = Profile.create!(first_name: "Stella", last_name: "Dubilier", username: "Stella", city: "Berlin", highest_education: "Bachelor", edu_organization: "Universit??t der K??nste Berlin",  working_experience: "3-5 years", position: "Freelancer", target_industry: "Design", preferred_language: "English", type_of_meeting: "online", user: user_stella)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670349892/stella_m0libw.png")
mentee_stella.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_detlef = User.create!(email: "detlef@hotmail.com", password: "Pedro1234", mentor: false)
mentee_detlef = Profile.create!(first_name: "Detlef", last_name: "Hauser", username: "Didi", city: "Berlin", highest_education: "Bachelor", edu_organization: "Universit??t der K??nste Berlin",  working_experience: "1-2 years", position: "Freelancer", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_detlef)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670349877/detlef_drxy80.png")
mentee_detlef.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_friedrich = User.create!(email: "friedrich@hotmail.com", password: "Pedro1234", mentor: false)
mentee_friedrich = Profile.create!(first_name: "Friedrich", last_name: "Appels", username: "Fritz", city: "Hamburg", highest_education: "Bachelor", edu_organization: "HAW Hamburg",  working_experience: "3-5 years", position: "Associate", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_friedrich)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350100/fried_vmg5a4.jpg")
mentee_friedrich.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_clara = User.create!(email: "clara@hotmail.com", password: "Pedro1234", mentor: false)
mentee_clara = Profile.create!(first_name: "Clara", last_name: "Schulze", username: "Clara", city: "Berlin", highest_education: "Bachelor", edu_organization: "Universit??t der K??nste Berlin",  working_experience: "3-5 years", position: "Freelancer", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_clara)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670349874/clara_kuo0x1.jpg")
mentee_clara.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_sunny = User.create!(email: "sunny@hotmail.com", password: "Pedro1234", mentor: false)
mentee_sunny = Profile.create!(first_name: "Sunny", last_name: "Bremer", username: "Sunny", city: "Berlin", highest_education: "Bachelor", edu_organization: "HAW Hamburg",  working_experience: "1-2 years", position: "Associate", target_industry: "Design", preferred_language: "German", type_of_meeting: "online", user: user_sunny)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670349894/sunny_ilv7hv.jpg")
mentee_sunny.photo.attach(io: file, filename: "test.png", content_type: "image/png")

puts "Creating mentors"

user_chloe = User.create!(email: "chloe@hotmail.com", password: "Pedro1234", mentor: true)
mentee_chloe = Profile.create!(first_name: "Chloe", last_name: "Bowers", username: "Chlo", position: "Managing Director", city: "Berlin", highest_education: "Master", target_industry: "Consulting", preferred_language: "Spanish", type_of_meeting: "online", user: user_chloe)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670489572/chloe-mentor_cqtyyq.jpg")
mentee_chloe.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user = User.create!(email: "ulrich@hotmail.com", password: "Pedro1234", mentor: true)
mentor = Profile.create!(first_name: "Ulrich", last_name: "Meister", username: "Uli", position: "Managing Principal", city: "Berlin", highest_education: "Master", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350593/ulrich_ebtcg1.jpg")
mentor.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_sandra = User.create!(email: "sandra@hotmail.com", password: "Pedro1234", mentor: true)
mentor_sandra = Profile.create!(first_name: "Sandra", last_name: "M??ller", username: "Sandi", position: "Partner", city: "Frankfurt", highest_education: "Master", target_industry: "Education Management", preferred_language: "German", type_of_meeting: "online", user: user_sandra)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350582/sandra_ab5fyb.jpg")
mentor_sandra.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_robert = User.create!(email: "robert@hotmail.com", password: "Pedro1234", mentor: true)
mentor_robert = Profile.create!(first_name: "Robert", last_name: "Harre", username: "Robert", position: "Partner", city: "Hamburg", highest_education: "Master", target_industry: "Architecture & Planning", preferred_language: "German", type_of_meeting: "online", user: user_robert)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350580/robert_pxjp8t.webp")
mentor_robert.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_sophie = User.create!(email: "sophie@hotmail.com", password: "Pedro1234", mentor: true)
mentor_sophie = Profile.create!(first_name: "Sophie", last_name: "Stadler", username: "Sophie", position: "Managing Director", city: "M??nchen", highest_education: "Master", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user_sophie)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350586/sophie_noul1m.jpg")
mentor_sophie.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_stefan = User.create!(email: "stefan@hotmail.com", password: "Pedro1234", mentor: true)
mentor_stefan = Profile.create!(first_name: "Stefan", last_name: "Steinkamp", username: "Stefan", position: "Partner", city: "Berlin", highest_education: "Phd", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user_stefan)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350592/stefan_fwaecz.jpg")
mentor_stefan.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_birgit = User.create!(email: "birgit@hotmail.com", password: "Pedro1234", mentor: true)
mentor_birgit = Profile.create!(first_name: "Birgit", last_name: "Gockel", username: "Birgit", position: "Partner", city: "Berlin", highest_education: "Master", target_industry: "Consulting", preferred_language: "German", type_of_meeting: "online", user: user_birgit)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350578/birgit_gpvnxj.jpg")
mentor_birgit.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_lars = User.create!(email: "lars@hotmail.com", password: "Pedro1234", mentor: true)
mentor_lars = Profile.create!(first_name: "Lars", last_name: "Johanson", username: "Lars", position: "Partner", city: "Hamburg", highest_education: "Master", target_industry: "Design", preferred_language: "English", type_of_meeting: "online", user: user_lars)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670350579/lars_xoxqdr.jpg")
mentor_lars.photo.attach(io: file, filename: "test.png", content_type: "image/png")

user_ursula = User.create!(email: "ursula@hotmail.com", password: "Pedro1234", mentor: true)
mentor_ursula = Profile.create!(first_name: "Ursula", last_name: "Martin", username: "Ursula", position: "Managing Director", city: "Hamburg", highest_education: "Master", target_industry: "Consulting", preferred_language: "English", type_of_meeting: "online", user: user_ursula)
file = Down.download("https://res.cloudinary.com/dvauxokiu/image/upload/v1670496724/ursula_becs0f.jpg")
mentor_ursula.photo.attach(io: file, filename: "test.png", content_type: "image/png")

# unmatch_52 = Match.create!(mentor_id: mentor.id, mentee_id: mentee.id, match: false)

puts "Creating match!"

# chatroom_1 = Chatroom.create!(match_id: match_1.id)

puts "Creating meeting!"
