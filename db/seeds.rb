# frozen_string_literal: true

puts "Seeding database..."

# ============================================
# PAGE CONTENTS
# ============================================
puts "Creating page contents..."

PageContent.find_or_create_by!(slug: "home_presentation") do |content|
  content.title = "Présentation du restaurant"
  content.body = <<~HTML
    <p class="text-xl font-medium text-forest-800">
      Bienvenue au restaurant Club House Tchanqué, restaurant du golf à Villenave d'Ornon.
    </p>

    <p>
      Situé sur l'historique Domaine de Geneste, découvrez notre restaurant niché au coeur du cadre naturel du golf. Nul besoin d'être golfeur ou abonné pour venir passer un moment dans notre restaurant, le Club House Tchanqué est ouvert à tous !
    </p>

    <p>
      Précisément situé au 43 avenue Mirieu de Labarre à Villenave d'Ornon, l'équipe de la Tchanqué vous accueille tous les jours, de 8h à 19h en été, et de 8h30 à 18h en hiver.
    </p>

    <p>
      Le Club House Tchanqué propose un service de bar tout au long de la journée, et également un service de restauration de 12h00 à 15h00.
    </p>

    <p>
      Déjeunez à la carte, découvrez les suggestions du Chef ou laissez-vous porter par le menu du jour ! Chacun des mets proposés par le restaurant est cuisiné à partir de produits frais et de saison, sélectionnés avec soin.
    </p>

    <p>
      Notre restaurant met à disposition de sa clientèle une grande terrasse offrant une vue panoramique sur le golf et son lac, une grande salle intérieur attenante au bar, ainsi qu'une salle privative.
    </p>

    <p>
      À l'occasion d'événements de groupes, privés ou professionnels, le restaurant compose des menus sur-mesure en fonction de votre besoin. Ainsi, créez un événement qui vous ressemble, que ce soit pour un déjeuner, une réunion ou un séminaire d'entreprise. À titre exceptionnel, il est possible de privatiser le restaurant en soirée.
    </p>

    <p>
      N'hésitez pas à nous faire part de votre projet, toute l'équipe sera ravie de vous accompagner et de vous proposer une prestation qui vous ressemble.
    </p>

    <p class="text-xl font-medium text-forest-800 italic">
      Le Club House Tchanqué, c'est un personnel attentionné et des cuisiniers passionnés… Venez à La Tchanqué, vous ne voudrez plus nous quitter !
    </p>
  HTML
end

PageContent.find_or_create_by!(slug: "evenements_salle") do |content|
  content.title = "À propos de notre salle de réunion"
  content.body = <<~HTML
    <p>
      Le restaurant Club House Tchanqué met à disposition une <strong class="text-forest-800">salle de réunion de 40m²</strong>, à seulement quelques minutes du centre-ville de Bordeaux ! Vous profiterez de la vue qu'offre notre salle sur le golf et son lac, tout en travaillant. Ainsi, surprenez vos collaborateurs en organisant votre évènement sur-mesure dans un cadre exceptionnel !
    </p>

    <p>
      Confortablement installé, vous profitez d'un espace de travail calme, éclairé naturellement. Pour vous assurer d'avoir tout ce dont vous avez besoin, notre <strong class="text-gold-600">salle Birdie</strong> est équipée d'un vidéo-projecteur, d'une connexion wifi dédiée, et de la climatisation. Enfin, la superficie disponible permet d'accueillir <strong class="text-forest-800">jusqu'à 30 personnes</strong> au maximum. L'agencement de la salle privative dépend du nombre de personnes à installer.
    </p>
  HTML
end

PageContent.find_or_create_by!(slug: "evenements_formules") do |content|
  content.title = "Nos formules réunion"
  content.body = <<~HTML
    <p>
      Pour agrémenter votre journée de réunion, nous vous proposons de <strong class="text-forest-800">créer votre formule</strong>. Ainsi, choisissez d'inclure un petit-déjeuner d'accueil (café, viennoiseries, jus de fruits), une pause rafraichissante (café et jus de fruits), une pause gourmande (café et mignardises sucrées), et enfin, le déjeuner avec ou sans vin.
    </p>
    <p class="text-xl font-medium text-forest-800 italic">
      Choisissez votre formule, communiquez nous votre programme… La Team Tchanqué s'occupe du reste !
    </p>
  HTML
end

PageContent.find_or_create_by!(slug: "evenements_prive") do |content|
  content.title = "Votre événement privé au Club House Tchanqué"
  content.body = <<~HTML
    <p>
      Nous louons notre salle privative pour des <strong>événements privés</strong> tels que des anniversaires, des baptêmes ou des repas de fin d'année. À l'occasion de ces événements particuliers, nous élaborons des <strong>menus personnalisés</strong>.
    </p>

    <p>
      Vous avez même la possibilité de combiner votre repas avec une <strong>initiation au golf</strong> !
    </p>

    <p>
      Si vous souhaitez obtenir des informations complémentaires ou demander un devis pour votre événement, n'hésitez pas à nous contacter par téléphone au <strong>09 61 63 15 27</strong> ou par mail à l'adresse suivante : <strong>sasvmrestaurations@gmail.com</strong>.
    </p>
  HTML
end

# ============================================
# MENU ITEMS - ENTRÉES
# ============================================
puts "Creating menu items..."

[
  { name: "Salade du Club House", description: "Mesclun, tomates confites, magret fumé, noix et copeaux de parmesan", price: 14, position: 1 },
  { name: "Velouté de saison", description: "Selon l'inspiration du chef, accompagné de croûtons maison", price: 9, position: 2 },
  { name: "Foie gras maison", description: "Mi-cuit, chutney de figues et pain toasté", price: 18, position: 3 },
  { name: "Huîtres du Bassin", description: "6 pièces - Huîtres spéciales du Bassin d'Arcachon", price: 15, position: 4 }
].each do |item|
  MenuItem.find_or_create_by!(name: item[:name], category: "entrees") do |mi|
    mi.description = item[:description]
    mi.price = item[:price]
    mi.position = item[:position]
  end
end

# PLATS
[
  { name: "Entrecôte grillée", description: "300g, sauce au poivre ou échalotes, frites maison", price: 26, position: 1 },
  { name: "Magret de canard", description: "Sauce aux cèpes, pommes sarladaises", price: 24, position: 2 },
  { name: "Pavé de saumon", description: "Sauce vierge, riz basmati et légumes de saison", price: 22, position: 3 },
  { name: "Burger du Club House", description: "Boeuf charolais, bacon, cheddar, oignons confits, frites maison", price: 19, position: 4 },
  { name: "Plat du jour", description: "Selon l'inspiration du chef - Demandez à votre serveur", price: 16, position: 5 }
].each do |item|
  MenuItem.find_or_create_by!(name: item[:name], category: "plats") do |mi|
    mi.description = item[:description]
    mi.price = item[:price]
    mi.position = item[:position]
  end
end

# DESSERTS
[
  { name: "Fondant au chocolat", description: "Coeur coulant, glace vanille", price: 9, position: 1 },
  { name: "Crème brûlée", description: "À la vanille de Madagascar", price: 8, position: 2 },
  { name: "Café gourmand", description: "Café accompagné de 3 mignardises du chef", price: 10, position: 3 },
  { name: "Canelés bordelais", description: "Duo de canelés maison, crème anglaise", price: 8, position: 4 }
].each do |item|
  MenuItem.find_or_create_by!(name: item[:name], category: "desserts") do |mi|
    mi.description = item[:description]
    mi.price = item[:price]
    mi.position = item[:position]
  end
end

# ============================================
# WINE ITEMS
# ============================================
puts "Creating wine items..."

# Vins blancs
[
  { name: "Le Louvetier", appellation: "Inspiré par La Louvière, André Lurton", glass_price: 6, bottle_price: 26, position: 1 },
  { name: "Le Bal des Papillons", appellation: "Côtes de Gascogne", glass_price: 7, bottle_price: 27, position: 2 },
  { name: "Belleruche", appellation: "Côtes du Rhône", glass_price: 8, bottle_price: 30, position: 3 },
  { name: "Notre-Dame de la Solitude", appellation: "Graves", glass_price: nil, bottle_price: 36, position: 4 }
].each do |item|
  WineItem.find_or_create_by!(name: item[:name], category: "blanc") do |wi|
    wi.appellation = item[:appellation]
    wi.glass_price = item[:glass_price]
    wi.bottle_price = item[:bottle_price]
    wi.position = item[:position]
  end
end

# Vins rosés
[
  { name: "Le Louvetier", appellation: "Bordeaux, A. Lurton", glass_price: 6, bottle_price: 26, position: 1 },
  { name: "Les Hauts de Masterel", appellation: "Côtes de Provence", glass_price: 7, bottle_price: 30, position: 2 }
].each do |item|
  WineItem.find_or_create_by!(name: item[:name], category: "rose") do |wi|
    wi.appellation = item[:appellation]
    wi.glass_price = item[:glass_price]
    wi.bottle_price = item[:bottle_price]
    wi.position = item[:position]
  end
end

# Vins rouges
[
  { name: "Le Louvetier", appellation: "Bordeaux, A. Lurton", glass_price: 6, bottle_price: 26, position: 1 },
  { name: "Bicicleta", appellation: "Chili, Carménère", glass_price: 7, bottle_price: 27, position: 2 },
  { name: "Belleruche", appellation: "Côtes du Rhône", glass_price: nil, bottle_price: 30, position: 3 },
  { name: "Château Saint Aubin", appellation: "Bordeaux", glass_price: nil, bottle_price: 32, position: 4 },
  { name: "Notre Dame de la Solitude", appellation: "Graves", glass_price: nil, bottle_price: 36, position: 5 },
  { name: "Châteaux Valoux", appellation: "Pessac Léognan", glass_price: 9, bottle_price: 38, position: 6 },
  { name: "Étoile by Haut Nouchet", appellation: "Pessac Léognan", glass_price: nil, bottle_price: 42, position: 7 },
  { name: "Les Meysonniers", appellation: "Crozes Hermitage, M. Chapoutier", glass_price: nil, bottle_price: 43, position: 8 },
  { name: "La Coccinelle de Petit Bocq", appellation: "Saint-Estèphe", glass_price: nil, bottle_price: 49, position: 9 },
  { name: "Confidences Prieuré de Lichine", appellation: "Margaux", glass_price: nil, bottle_price: 65, position: 10 }
].each do |item|
  WineItem.find_or_create_by!(name: item[:name], category: "rouge") do |wi|
    wi.appellation = item[:appellation]
    wi.glass_price = item[:glass_price]
    wi.bottle_price = item[:bottle_price]
    wi.position = item[:position]
  end
end

# Champagne
WineItem.find_or_create_by!(name: "Nicolas Feuillatte Brut", category: "champagne") do |wi|
  wi.appellation = "Champagne"
  wi.glass_price = nil
  wi.bottle_price = 60
  wi.position = 1
end

# ============================================
# FORMULAS
# ============================================
puts "Creating formulas..."

[
  { name: "Formule Déjeuner", description: "Plat + Dessert", price: 22, position: 1 },
  { name: "Menu Complet", description: "Entrée + Plat + Dessert", price: 32, position: 2 }
].each do |item|
  Formula.find_or_create_by!(name: item[:name]) do |f|
    f.description = item[:description]
    f.price = item[:price]
    f.position = item[:position]
  end
end

puts "Seeding complete!"
puts ""
puts "Summary:"
puts "  - PageContents: #{PageContent.count}"
puts "  - MenuItems: #{MenuItem.count}"
puts "  - WineItems: #{WineItem.count}"
puts "  - Formulas: #{Formula.count}"
puts ""
puts "Admin access:"
puts "  URL: /admin"
puts "  Login: admin"
puts "  Password: tchanque2024 (or ADMIN_PASSWORD env variable)"
