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
  # I had to remove mentor to be able to create mock data, why?

  def assign_matches
    mentor ? find_mentees : find_mentors
  end

  def find_mentees
    matches_as_mentor.each do |match|
      Like.where(match_id: match.id).delete_all
      match.chatroom.delete
      match.meetings.delete_all
    end
    matches_as_mentor.destroy_all
    matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry, city: city }, users: { mentor: false })
    matching_profiles.each { |profile| match = Match.create(mentee_id: profile.id, mentor_id: id) }
  end

  def find_mentors
    matches_as_mentee.each do |match|
      Like.where(match_id: match.id).delete_all
      match.chatroom.delete
      match.meetings.delete_all
    end
    matches_as_mentee.destroy_all
    matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry, city: city }, users: { mentor: true })
    matching_profiles.each { |profile| match = Match.create(mentee_id: id, mentor_id: profile.id) }
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

  CITIES = ["Aachen", "Aalen", "Achern", "Achim", "Ahaus", "Ahlen", "Ahrensburg", "Aichach", "Albstadt", "Alsdorf", "Altenburg", "Altenkirchen", "Altötting", "Alzey", "Amberg", "Andernach", "Annaberg-Buchholz", "Ansbach", "Apolda", "Arnsberg", "Arnstadt", "Aschaffenburg", "Aschersleben", "Augsburg", "Aurich", "Backnang", "Bad Dürkheim", "Bad Ems", "Bad Fallingbostel", "Bad Hersfeld", "Bad Homburg", "Bad Honnef am Rhein", "Bad Kissingen", "Bad Kreuznach", "Bad Nauheim", "Bad Neuenahr-Ahrweiler", "Bad Neustadt", "Bad Oeynhausen", "Bad Oldesloe", "Bad Reichenhall", "Bad Salzuflen", "Bad Salzungen", "Bad Schwalbach", "Bad Segeberg", "Bad Tölz", "Bad Vilbel", "Bad Zwischenahn", "Baden-Baden", "Baesweiler", "Balingen", "Bamberg", "Barsinghausen", "Baunatal", "Bautzen", "Bayreuth", "Beckum", "Beeskow", "Bensheim", "Bergheim", "Bergisch Gladbach", "Bergkamen", "Berlin", "Bernburg", "Biberach", "Bielefeld", "Bietigheim-Bissingen", "Bingen am Rhein", "Birkenfeld", "Bitburg", "Bitterfeld", "Blankenfelde", "Böblingen", "Bocholt", "Bochum", "Bonn", "Borken", "Bornheim", "Bottrop", "Brake", "Bramsche", "Brandenburg", "Braunschweig", "Bremen", "Bremerhaven", "Bretten", "Brilon", "Bruchsal", "Brühl", "Buchholz in der Nordheide", "Bühl", "Bünde", "Burg", "Burgdorf", "Butzbach", "Buxtehude", "Calw", "Castrop-Rauxel", "Celle", "Cham", "Chemnitz", "Cloppenburg", "Coburg", "Cochem", "Coesfeld", "Cottbus", "Crailsheim", "Cuxhaven", "Dachau", "Darmstadt", "Datteln", "Daun", "Deggendorf", "Delbrück", "Delmenhorst", "Dessau-Roßlau", "Detmold", "Diepholz", "Dietzenbach", "Dillingen", "Dingolfing", "Dinslaken", "Donauwörth", "Dormagen", "Dorsten", "Dortmund", "Dreieich", "Dresden", "Duisburg", "Dülmen", "Düren", "Düsseldorf", "Ebersberg", "Eberswalde", "Ehingen an der Donau", "Eichstätt", "Einbeck", "Eisenach", "Eisenberg", "Elmshorn", "Emden", "Emmendingen", "Emsdetten", "Ennepetal", "Erbach", "Erding", "Erftstadt", "Erfurt", "Erkelenz", "Erkrath", "Erlangen", "Eschwege", "Eschweiler", "Essen", "Esslingen", "Ettlingen", "Euskirchen", "Eutin", "Falkensee", "Fellbach", "Filderstadt", "Flensburg", "Forchheim", "Forst (Lausitz)", "Frankenthal", "Frankfurt", "Frankfurt (Oder)", "Frechen", "Freiberg", "Freiburg im Breisgau", "Freising", "Freital", "Freudenstadt", "Freyung", "Friedberg", "Friedberg", "Friedrichsdorf", "Friedrichshafen", "Fulda", "Fürstenfeldbruck", "Fürstenwalde", "Fürth", "Gaggenau", "Ganderkesee", "Garbsen", "Garmisch-Partenkirchen", "Geesthacht", "Geilenkirchen", "Geislingen an der Steige", "Geldern", "Gelsenkirchen", "Georgsmarienhütte", "Gera", "Geretsried", "Germering", "Germersheim", "Gevelsberg", "Gießen", "Gifhorn", "Gladbeck", "Goch", "Göppingen", "Görlitz", "Goslar", "Gotha", "Göttingen", "Greifswald", "Greiz", "Greven", "Grevenbroich", "Griesheim", "Grimma", "Gronau", "Groß-Gerau", "Gummersbach", "Günzburg", "Güstrow", "Gütersloh", "Haan", "Hagen", "Halberstadt", "Haldensleben", "Halle", "Hamburg", "Hameln", "Hamm", "Hamminkeln", "Hanau", "Hannover", "Haßfurt", "Hattersheim", "Hattingen", "Heide", "Heidelberg", "Heidenheim", "Heilbad Heiligenstadt", "Heilbronn", "Heiligenhaus", "Heinsberg", "Helmstedt", "Hemer", "Hennigsdorf", "Henstedt-Ulzburg", "Heppenheim", "Herford", "Herne", "Herrenberg", "Herten", "Herzberg", "Herzogenrath", "Hildburghausen", "Hilden", "Hildesheim", "Hof", "Hofheim", "Hohen Neuendorf", "Holzminden", "Homberg", "Homburg", "Höxter", "Hoyerswerda", "Hückelhoven", "Hürth", "Husum", "Ibbenbüren", "Ilmenau", "Ingelheim", "Ingolstadt", "Iserlohn", "Itzehoe", "Jena", "Jever", "Jülich", "Kaarst", "Kaiserslautern", "Kamen", "Kamp-Lintfort", "Karlsruhe", "Karlstadt", "Kassel", "Kaufbeuren", "Kehl", "Kelheim", "Kelkheim (Taunus)", "Kempen", "Kempten", "Kerpen", "Kevelaer", "Kiel", "Kirchheim unter Teck", "Kirchheimbolanden", "Kitzingen", "Kleve", "Koblenz", "Köln", "Königs Wusterhausen", "Königsbrunn", "Königswinter", "Konstanz", "Korbach", "Kornwestheim", "Korschenbroich", "Köthen", "Krefeld", "Kreuztal", "Kronach", "Kulmbach", "Künzelsau", "Kusel", "Laatzen", "Lage", "Lampertheim", "Landau", "Landsberg", "Landshut", "Langen", "Langenfeld", "Langenhagen", "Lauf", "Lauterbach", "Leer", "Lehrte", "Leichlingen", "Leimen", "Leinfelden-Echterdingen", "Leipzig", "Lemgo", "Lennestadt", "Leonberg", "Leverkusen", "Lichtenfels", "Limburg", "Lindau", "Lingen", "Lippstadt", "Lohmar", "Lohne", "Löhne", "Lörrach", "Lübbecke", "Lübben (Spreewald)", "Lübeck", "Lüchow", "Luckenwalde", "Lüdenscheid", "Ludwigsburg", "Ludwigsfelde", "Ludwigshafen", "Lüneburg", "Lünen", "Magdeburg", "Maintal", "Mainz", "Mannheim", "Marburg", "Marktoberdorf", "Marl", "Mechernich", "Meerbusch", "Meiningen", "Meißen", "Melle", "Memmingen", "Meppen", "Merseburg", "Merzig", "Meschede", "Mettmann", "Miesbach", "Miltenberg", "Mindelheim", "Minden", "Moers", "Mönchengladbach", "Montabaur", "Mörfelden-Walldorf", "Mosbach", "Mühlacker", "Mühldorf", "Mühlhausen", "Mülheim", "München", "Münster", "Naumburg", "Neckarsulm", "Nettetal", "Neu Isenburg", "Neu-Ulm", "Neubrandenburg", "Neuburg", "Neumarkt", "Neumünster", "Neunkirchen", "Neuruppin", "Neuss", "Neustadt", "Neustadt", "Neustadt", "Neustadt", "Neustadt am Rübenberge", "Neuwied", "Niederkassel", "Nienburg", "Nordenham", "Norderstedt", "Nordhausen", "Nordhorn", "Northeim", "Nürnberg", "Nürtingen", "Oberhausen", "Oberursel", "Oelde", "Oer-Erkenschwick", "Offenbach", "Offenburg", "Oldenburg", "Olpe", "Oranienburg", "Osnabrück", "Osterholz-Scharmbeck", "Osterode", "Ostfildern", "Overath", "Paderborn", "Papenburg", "Parchim", "Passau", "Peine", "Perleberg", "Petershagen", "Pfaffenhofen", "Pfarrkirchen", "Pforzheim", "Pfungstadt", "Pinneberg", "Pirmasens", "Pirna", "Plauen", "Plettenberg", "Plön", "Porta Westfalica", "Potsdam", "Prenzlau", "Pulheim", "Radebeul", "Radolfzell am Bodensee", "Rastatt", "Rathenow", "Ratingen", "Ratzeburg", "Ravensburg", "Recklinghausen", "Regen", "Regensburg", "Reinbek", "Remscheid", "Rendsburg", "Reutlingen", "Rheda-Wiedenbrück", "Rheinbach", "Rheinberg", "Rheine", "Rheinfelden (Baden)", "Riesa", "Rietberg", "Rinteln", "Rodgau", "Rosenheim", "Rösrath", "Rostock", "Rotenburg", "Roth", "Rottweil", "Rüsselsheim", "Saalfeld", "Saarbrücken", "Saarlouis", "Salzgitter", "Salzwedel", "Sangerhausen", "Sankt Augustin", "Sankt Ingbert", "Sankt Wendel", "Schleiz", "Schleswig", "Schloß Holte-Stukenbrock", "Schönebeck", "Schorndorf", "Schwabach", "Schwäbisch Gmünd", "Schwäbisch Hall", "Schwandorf", "Schwedt (Oder)", "Schweinfurt", "Schwelm", "Schwerin", "Schwerte", "Seelow", "Seelze", "Seevetal", "Selm", "Senftenberg", "Siegburg", "Siegen", "Sigmaringen", "Simmern", "Sindelfingen", "Sinsheim", "Soest", "Solingen", "Sömmerda", "Sondershausen", "Sonneberg", "Sonthofen", "Speyer", "Springe", "Stade", "Stadthagen", "Starnberg", "Staßfurt", "Steinfurt", "Stendal", "Stolberg", "Stralsund", "Straubing", "Strausberg", "Stuhr", "Stuttgart", "Suhl", "Sundern", "Tauberbischofsheim", "Taunusstein", "Teltow", "Tirschenreuth", "Tönisvorst", "Torgau", "Traunstein", "Trier", "Troisdorf", "Tübingen", "Tuttlingen", "Uelzen", "Ulm", "Unna", "Unterschleißheim", "Vaihingen an der Enz", "Vechta", "Velbert", "Verden", "Verl", "Viernheim", "Viersen", "Villingen-Schwenningen", "Völklingen", "Waiblingen", "Waldshut-Tiengen", "Waltrop", "Wangen im Allgäu", "Warendorf", "Wedel", "Wegberg", "Weiden", "Weil am Rhein", "Weilheim", "Weimar", "Weinheim", "Weißenburg", "Weißenfels", "Weiterstadt", "Werl", "Wermelskirchen", "Wernigerode", "Werve", "Wesel", "Wesseling", "Westerstede", "Wetter (Ruhr)", "Wetzlar", "Weyhe", "Wiesbaden", "Wiesloch", "Wilhelmshaven", "Willich", "Winnenden", "Winsen", "Wismar", "Witten", "Wittenberg", "Wittlich", "Wittmund", "Wolfenbüttel", "Wolfsburg", "Worms", "Wunsiedel", "Wunstorf", "Wuppertal", "Würselen", "Würzburg", "Zeitz", "Zirndorf", "Zittau", "Zweibrücken", "Zwickau", ]
end
