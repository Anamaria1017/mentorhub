class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :matches_as_mentee, foreign_key: "mentee_id", class_name: "Match", dependent: :destroy
  has_many :matches_as_mentor, foreign_key: "mentor_id", class_name: "Match", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :first_name, :last_name, :username, :city, :target_industry, presence: true
  delegate :mentor, to: :user

  after_save :assign_matches

  def assign_matches
    mentor ? find_mentees : find_mentors
  end

  def find_mentees
    matches_as_mentor.each do |match|
      Like.where(match_id: match.id).delete_all
      match.chatroom.messages.delete_all
      match.chatroom.delete
      match.meetings.delete_all
    end
    matches_as_mentor.destroy_all

    if proximity_preference == "Same city"
      matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry, city: city}, users: { mentor: false })
      matching_profiles.each { |profile| match = Match.create(mentee_id: profile.id, mentor_id: id) }
    else
      matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry}, users: { mentor: false })
      matching_profiles.each { |profile| match = Match.create(mentee_id: profile.id, mentor_id: id) }
    end
  end

  def find_mentors
    matches_as_mentee.each do |match|
      Like.where(match_id: match.id).delete_all
      match.chatroom.messages.delete_all
      match.chatroom.delete
      match.meetings.delete_all
    end
    matches_as_mentee.destroy_all

    if proximity_preference == "Same city"
      matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry, city: city  }, users: { mentor: true })
      matching_profiles.each { |profile| match = Match.create(mentee_id: id, mentor_id: profile.id) }
    else
      matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry }, users: { mentor: true })
      matching_profiles.each { |profile| match = Match.create(mentee_id: id, mentor_id: profile.id) }
    end
  end

  INDRUSTRIES = ["Accounting",
      "Airlines/Aviation",
      "Alternative Dispute Resolution",
      "Alternative Medicine",
      "Animation",
      "Apparel & Fashion",
      "Architecture & Planning",
      "Arts & Crafts",
      "Automotive",
      "Aviation & Aerospace",
      "Banking",
      "Biotechnology",
      "Broadcast Media",
      "Building Materials",
      "Business Supplies & Equipment",
      "Capital Markets",
      "Chemicals",
      "Civic & Social Organization",
      "Civil Engineering",
      "Commercial Real Estate",
      "Computer & Network Security",
      "Computer Games",
      "Computer Hardware",
      "Computer Networking",
      "Computer Software",
      "Construction",
      "Consulting",
      "Consumer Electronics",
      "Consumer Goods",
      "Consumer Services",
      "Cosmetics",
      "Dairy",
      "Defense & Space",
      "Design",
      "Education Management",
      "E-learning",
      "Electrical & Electronic Manufacturing",
      "Entertainment",
      "Environmental Services",
      "Events Services",
      "Executive Office",
      "Facilities Services",
      "Farming",
      "Financial Services",
      "Fine Art",
      "Fishery",
      "Food & Beverages",
      "Food Production",
      "Fundraising",
      "Furniture",
      "Gambling & Casinos",
      "Glass", "Ceramics & Concrete",
      "Government Administration",
      "Government Relations",
      "Graphic Design",
      "Health", "Wellness & Fitness",
      "Higher Education",
      "Hospital & Health Care",
      "Hospitality",
      "Human Resources",
      "Import & Export",
      "Individual & Family Services",
      "Industrial Automation",
      "Information Services",
      "Information Technology & Services",
      "Insurance",
      "International Affairs",
      "International Trade & Development",
      "Internet",
      "Investment Banking/Venture",
      "Investment Management",
      "Judiciary",
      "Law Enforcement",
      "Law Practice",
      "Legal Services",
      "Legislative Office",
      "Leisure & Travel",
      "Libraries",
      "Logistics & Supply Chain",
      "Luxury Goods & Jewelry",
      "Machinery",
      "Management Consulting",
      "Maritime",
      "Marketing & Advertising",
      "Market Research",
      "Mechanical or Industrial Engineering",
      "Media Production",
      "Medical Device",
      "Medical Practice",
      "Mental Health Care",
      "Military",
      "Mining & Metals",
      "Motion Pictures & Film",
      "Museums & Institutions",
      "Music",
      "Nanotechnology",
      "Newspapers",
      "Nonprofit Organization Management",
      "Oil & Energy",
      "Online Publishing",
      "Outsourcing/Offshoring",
      "Package/Freight Delivery",
      "Packaging & Containers",
      "Paper & Forest Products",
      "Performing Arts",
      "Pharmaceuticals",
      "Philanthropy",
      "Photography",
      "Plastics",
      "Political Organization",
      "Primary/Secondary",
      "Printing",
      "Professional Training",
      "Program Development",
      "Public Policy",
      "Public Relations",
      "Public Safety",
      "Publishing",
      "Railroad Manufacture",
      "Ranching",
      "Real Estate",
      "Recreational",
      "Facilities & Services",
      "Religious Institutions",
      "Renewables & Environment",
      "Research",
      "Restaurants",
      "Retail",
      "Security & Investigations",
      "Semiconductors",
      "Shipbuilding",
      "Sporting Goods",
      "Sports",
      "Staffing & Recruiting",
      "Supermarkets",
      "Taxes & Accounting",
      "Telecommunications",
      "Textiles",
      "Think Tanks",
      "Tobacco",
      "Translation & Localization",
      "Transportation/Trucking/Railroad",
      "Utilities",
      "Venture Capital",
      "Veterinary",
      "Warehousing",
      "Wholesale",
      "Wine & Spirits",
      "Wireless",
      "Writing & Editing"]

  SKILLS = ["Customer Service",
      "Sales",
      "Accounting",
      "Businesses Development",
      "Marketing",
      "Leadership",
      "Communication",
      "Digital Marketing",
      "Sales Management",
      "Problem Solving",
      "Management",
      "Finance",
      "Social Media",
      "Sales & Marketing",
      "Time Management",
      "Financial Analysis",
      "Engineering",
      "Strategy",
      "Social Media Marketing",
      "Law"]

  CITIES = ["Aachen", "Aalen", "Achern", "Achim", "Ahaus", "Ahlen", "Ahrensburg", "Aichach", "Albstadt", "Alsdorf", "Altenburg", "Altenkirchen", "Alt??tting", "Alzey", "Amberg", "Andernach", "Annaberg-Buchholz", "Ansbach", "Apolda", "Arnsberg", "Arnstadt", "Aschaffenburg", "Aschersleben", "Augsburg", "Aurich", "Backnang", "Bad D??rkheim", "Bad Ems", "Bad Fallingbostel", "Bad Hersfeld", "Bad Homburg", "Bad Honnef am Rhein", "Bad Kissingen", "Bad Kreuznach", "Bad Nauheim", "Bad Neuenahr-Ahrweiler", "Bad Neustadt", "Bad Oeynhausen", "Bad Oldesloe", "Bad Reichenhall", "Bad Salzuflen", "Bad Salzungen", "Bad Schwalbach", "Bad Segeberg", "Bad T??lz", "Bad Vilbel", "Bad Zwischenahn", "Baden-Baden", "Baesweiler", "Balingen", "Bamberg", "Barsinghausen", "Baunatal", "Bautzen", "Bayreuth", "Beckum", "Beeskow", "Bensheim", "Bergheim", "Bergisch Gladbach", "Bergkamen", "Berlin", "Bernburg", "Biberach", "Bielefeld", "Bietigheim-Bissingen", "Bingen am Rhein", "Birkenfeld", "Bitburg", "Bitterfeld", "Blankenfelde", "B??blingen", "Bocholt", "Bochum", "Bonn", "Borken", "Bornheim", "Bottrop", "Brake", "Bramsche", "Brandenburg", "Braunschweig", "Bremen", "Bremerhaven", "Bretten", "Brilon", "Bruchsal", "Br??hl", "Buchholz in der Nordheide", "B??hl", "B??nde", "Burg", "Burgdorf", "Butzbach", "Buxtehude", "Calw", "Castrop-Rauxel", "Celle", "Cham", "Chemnitz", "Cloppenburg", "Coburg", "Cochem", "Coesfeld", "Cottbus", "Crailsheim", "Cuxhaven", "Dachau", "Darmstadt", "Datteln", "Daun", "Deggendorf", "Delbr??ck", "Delmenhorst", "Dessau-Ro??lau", "Detmold", "Diepholz", "Dietzenbach", "Dillingen", "Dingolfing", "Dinslaken", "Donauw??rth", "Dormagen", "Dorsten", "Dortmund", "Dreieich", "Dresden", "Duisburg", "D??lmen", "D??ren", "D??sseldorf", "Ebersberg", "Eberswalde", "Ehingen an der Donau", "Eichst??tt", "Einbeck", "Eisenach", "Eisenberg", "Elmshorn", "Emden", "Emmendingen", "Emsdetten", "Ennepetal", "Erbach", "Erding", "Erftstadt", "Erfurt", "Erkelenz", "Erkrath", "Erlangen", "Eschwege", "Eschweiler", "Essen", "Esslingen", "Ettlingen", "Euskirchen", "Eutin", "Falkensee", "Fellbach", "Filderstadt", "Flensburg", "Forchheim", "Forst (Lausitz)", "Frankenthal", "Frankfurt", "Frankfurt (Oder)", "Frechen", "Freiberg", "Freiburg im Breisgau", "Freising", "Freital", "Freudenstadt", "Freyung", "Friedberg", "Friedberg", "Friedrichsdorf", "Friedrichshafen", "Fulda", "F??rstenfeldbruck", "F??rstenwalde", "F??rth", "Gaggenau", "Ganderkesee", "Garbsen", "Garmisch-Partenkirchen", "Geesthacht", "Geilenkirchen", "Geislingen an der Steige", "Geldern", "Gelsenkirchen", "Georgsmarienh??tte", "Gera", "Geretsried", "Germering", "Germersheim", "Gevelsberg", "Gie??en", "Gifhorn", "Gladbeck", "Goch", "G??ppingen", "G??rlitz", "Goslar", "Gotha", "G??ttingen", "Greifswald", "Greiz", "Greven", "Grevenbroich", "Griesheim", "Grimma", "Gronau", "Gro??-Gerau", "Gummersbach", "G??nzburg", "G??strow", "G??tersloh", "Haan", "Hagen", "Halberstadt", "Haldensleben", "Halle", "Hamburg", "Hameln", "Hamm", "Hamminkeln", "Hanau", "Hannover", "Ha??furt", "Hattersheim", "Hattingen", "Heide", "Heidelberg", "Heidenheim", "Heilbad Heiligenstadt", "Heilbronn", "Heiligenhaus", "Heinsberg", "Helmstedt", "Hemer", "Hennigsdorf", "Henstedt-Ulzburg", "Heppenheim", "Herford", "Herne", "Herrenberg", "Herten", "Herzberg", "Herzogenrath", "Hildburghausen", "Hilden", "Hildesheim", "Hof", "Hofheim", "Hohen Neuendorf", "Holzminden", "Homberg", "Homburg", "H??xter", "Hoyerswerda", "H??ckelhoven", "H??rth", "Husum", "Ibbenb??ren", "Ilmenau", "Ingelheim", "Ingolstadt", "Iserlohn", "Itzehoe", "Jena", "Jever", "J??lich", "Kaarst", "Kaiserslautern", "Kamen", "Kamp-Lintfort", "Karlsruhe", "Karlstadt", "Kassel", "Kaufbeuren", "Kehl", "Kelheim", "Kelkheim (Taunus)", "Kempen", "Kempten", "Kerpen", "Kevelaer", "Kiel", "Kirchheim unter Teck", "Kirchheimbolanden", "Kitzingen", "Kleve", "Koblenz", "K??ln", "K??nigs Wusterhausen", "K??nigsbrunn", "K??nigswinter", "Konstanz", "Korbach", "Kornwestheim", "Korschenbroich", "K??then", "Krefeld", "Kreuztal", "Kronach", "Kulmbach", "K??nzelsau", "Kusel", "Laatzen", "Lage", "Lampertheim", "Landau", "Landsberg", "Landshut", "Langen", "Langenfeld", "Langenhagen", "Lauf", "Lauterbach", "Leer", "Lehrte", "Leichlingen", "Leimen", "Leinfelden-Echterdingen", "Leipzig", "Lemgo", "Lennestadt", "Leonberg", "Leverkusen", "Lichtenfels", "Limburg", "Lindau", "Lingen", "Lippstadt", "Lohmar", "Lohne", "L??hne", "L??rrach", "L??bbecke", "L??bben (Spreewald)", "L??beck", "L??chow", "Luckenwalde", "L??denscheid", "Ludwigsburg", "Ludwigsfelde", "Ludwigshafen", "L??neburg", "L??nen", "Magdeburg", "Maintal", "Mainz", "Mannheim", "Marburg", "Marktoberdorf", "Marl", "Mechernich", "Meerbusch", "Meiningen", "Mei??en", "Melle", "Memmingen", "Meppen", "Merseburg", "Merzig", "Meschede", "Mettmann", "Miesbach", "Miltenberg", "Mindelheim", "Minden", "Moers", "M??nchengladbach", "Montabaur", "M??rfelden-Walldorf", "Mosbach", "M??hlacker", "M??hldorf", "M??hlhausen", "M??lheim", "M??nchen", "M??nster", "Naumburg", "Neckarsulm", "Nettetal", "Neu Isenburg", "Neu-Ulm", "Neubrandenburg", "Neuburg", "Neumarkt", "Neum??nster", "Neunkirchen", "Neuruppin", "Neuss", "Neustadt", "Neustadt", "Neustadt", "Neustadt", "Neustadt am R??benberge", "Neuwied", "Niederkassel", "Nienburg", "Nordenham", "Norderstedt", "Nordhausen", "Nordhorn", "Northeim", "N??rnberg", "N??rtingen", "Oberhausen", "Oberursel", "Oelde", "Oer-Erkenschwick", "Offenbach", "Offenburg", "Oldenburg", "Olpe", "Oranienburg", "Osnabr??ck", "Osterholz-Scharmbeck", "Osterode", "Ostfildern", "Overath", "Paderborn", "Papenburg", "Parchim", "Passau", "Peine", "Perleberg", "Petershagen", "Pfaffenhofen", "Pfarrkirchen", "Pforzheim", "Pfungstadt", "Pinneberg", "Pirmasens", "Pirna", "Plauen", "Plettenberg", "Pl??n", "Porta Westfalica", "Potsdam", "Prenzlau", "Pulheim", "Radebeul", "Radolfzell am Bodensee", "Rastatt", "Rathenow", "Ratingen", "Ratzeburg", "Ravensburg", "Recklinghausen", "Regen", "Regensburg", "Reinbek", "Remscheid", "Rendsburg", "Reutlingen", "Rheda-Wiedenbr??ck", "Rheinbach", "Rheinberg", "Rheine", "Rheinfelden (Baden)", "Riesa", "Rietberg", "Rinteln", "Rodgau", "Rosenheim", "R??srath", "Rostock", "Rotenburg", "Roth", "Rottweil", "R??sselsheim", "Saalfeld", "Saarbr??cken", "Saarlouis", "Salzgitter", "Salzwedel", "Sangerhausen", "Sankt Augustin", "Sankt Ingbert", "Sankt Wendel", "Schleiz", "Schleswig", "Schlo?? Holte-Stukenbrock", "Sch??nebeck", "Schorndorf", "Schwabach", "Schw??bisch Gm??nd", "Schw??bisch Hall", "Schwandorf", "Schwedt (Oder)", "Schweinfurt", "Schwelm", "Schwerin", "Schwerte", "Seelow", "Seelze", "Seevetal", "Selm", "Senftenberg", "Siegburg", "Siegen", "Sigmaringen", "Simmern", "Sindelfingen", "Sinsheim", "Soest", "Solingen", "S??mmerda", "Sondershausen", "Sonneberg", "Sonthofen", "Speyer", "Springe", "Stade", "Stadthagen", "Starnberg", "Sta??furt", "Steinfurt", "Stendal", "Stolberg", "Stralsund", "Straubing", "Strausberg", "Stuhr", "Stuttgart", "Suhl", "Sundern", "Tauberbischofsheim", "Taunusstein", "Teltow", "Tirschenreuth", "T??nisvorst", "Torgau", "Traunstein", "Trier", "Troisdorf", "T??bingen", "Tuttlingen", "Uelzen", "Ulm", "Unna", "Unterschlei??heim", "Vaihingen an der Enz", "Vechta", "Velbert", "Verden", "Verl", "Viernheim", "Viersen", "Villingen-Schwenningen", "V??lklingen", "Waiblingen", "Waldshut-Tiengen", "Waltrop", "Wangen im Allg??u", "Warendorf", "Wedel", "Wegberg", "Weiden", "Weil am Rhein", "Weilheim", "Weimar", "Weinheim", "Wei??enburg", "Wei??enfels", "Weiterstadt", "Werl", "Wermelskirchen", "Wernigerode", "Werve", "Wesel", "Wesseling", "Westerstede", "Wetter (Ruhr)", "Wetzlar", "Weyhe", "Wiesbaden", "Wiesloch", "Wilhelmshaven", "Willich", "Winnenden", "Winsen", "Wismar", "Witten", "Wittenberg", "Wittlich", "Wittmund", "Wolfenb??ttel", "Wolfsburg", "Worms", "Wunsiedel", "Wunstorf", "Wuppertal", "W??rselen", "W??rzburg", "Zeitz", "Zirndorf", "Zittau", "Zweibr??cken", "Zwickau", ]
end
