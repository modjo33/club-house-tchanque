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

# Supprimer les anciens items pour repartir à zéro avec les nouvelles données
MenuItem.destroy_all

[
  { name: "Oeuf Mimosa", description: nil, price: 9, position: 0 },
  { name: "Camembert Rôti", description: nil, price: 13, position: 1 },
  { name: "Jambon Serrano", description: nil, price: 15, position: 2 }
].each do |item|
  MenuItem.create!(
    name: item[:name],
    category: "entrees",
    description: item[:description],
    price: item[:price],
    position: item[:position]
  )
end

# PLATS
[
  { name: "Pâtes du Jour", description: "Parmesan, oignon, pignons, piment d'Espelette, huile de Basilic maison", price: 15, position: 0 },
  { name: "Plat du Jour", description: nil, price: 15, position: 1 },
  { name: "Salade César", description: nil, price: 19, position: 2 },
  { name: "Tartare à l'Italienne", description: "Parmesan, oignon, pignons, piment d'Espelette, huile de Basilic maison", price: 21, position: 3 },
  { name: "Fish and Chips", description: nil, price: 21, position: 4 },
  { name: "Bô Bun au Poulet Croustillant", description: "Fines noodles, salade romaine, nems de porc sauce Bo bun, cacahuètes, oignons frits", price: 21, position: 5 },
  { name: "Assiette du Golfeur", description: nil, price: 21, position: 6 }
].each do |item|
  MenuItem.create!(
    name: item[:name],
    category: "plats",
    description: item[:description],
    price: item[:price],
    position: item[:position]
  )
end

# DESSERTS
[
  { name: "Gaufre Liégeoise au Caramel", description: nil, price: 8, position: 0 },
  { name: "Pavlova au Coulis de Fruits Rouges", description: nil, price: 9, position: 1 },
  { name: "Café Gourmand", description: nil, price: 10, position: 2 }
].each do |item|
  MenuItem.create!(
    name: item[:name],
    category: "desserts",
    description: item[:description],
    price: item[:price],
    position: item[:position]
  )
end

# ============================================
# WINE ITEMS
# ============================================
puts "Creating wine items..."

# Supprimer les anciens items pour repartir à zéro avec les nouvelles données
WineItem.destroy_all

# Vins rouges
[
  { name: "Louvetier", appellation: "Bordeaux", glass_price: 6, bottle_price: 26, position: 0 },
  { name: "El Grano", appellation: "Chilien Carménère", glass_price: 7, bottle_price: 27, position: 1 },
  { name: "Belleruche", appellation: "Côtes du Rhône", glass_price: nil, bottle_price: 31, position: 2 },
  { name: "Ch. St Aubin", appellation: "Médoc", glass_price: nil, bottle_price: 32, position: 3 },
  { name: "Dame de la Solitude", appellation: "Graves", glass_price: nil, bottle_price: 37, position: 4 },
  { name: "Terrasses de la Garde", appellation: "Pessac-Léognan", glass_price: 9, bottle_price: 39, position: 5 },
  { name: "Étoile de Nouchet", appellation: "Pessac-Léognan", glass_price: nil, bottle_price: 42, position: 6 },
  { name: "Meysonniers", appellation: "Crozes Hermitage", glass_price: nil, bottle_price: 43, position: 7 },
  { name: "Coccinelle Petit Bocq", appellation: "St Estèphe", glass_price: nil, bottle_price: 49, position: 8 }
].each do |item|
  WineItem.create!(
    name: item[:name],
    category: "rouge",
    appellation: item[:appellation],
    glass_price: item[:glass_price],
    bottle_price: item[:bottle_price],
    position: item[:position]
  )
end

# Vins blancs
[
  { name: "Louvetier", appellation: "Bordeaux", glass_price: 6, bottle_price: 26, position: 0 },
  { name: "Bal des Papillons", appellation: "Côtes de Gascogne", glass_price: 7, bottle_price: 27, position: 1 },
  { name: "Belleruche", appellation: "Côtes du Rhône", glass_price: 8, bottle_price: 31, position: 2 }
].each do |item|
  WineItem.create!(
    name: item[:name],
    category: "blanc",
    appellation: item[:appellation],
    glass_price: item[:glass_price],
    bottle_price: item[:bottle_price],
    position: item[:position]
  )
end

# Vins rosés
[
  { name: "Louvetier", appellation: "Bordeaux", glass_price: 6, bottle_price: 26, position: 0 },
  { name: "Haut de Masterel", appellation: "Côtes de Provence", glass_price: 7, bottle_price: 30, position: 1 }
].each do |item|
  WineItem.create!(
    name: item[:name],
    category: "rose",
    appellation: item[:appellation],
    glass_price: item[:glass_price],
    bottle_price: item[:bottle_price],
    position: item[:position]
  )
end

# ============================================
# FORMULAS
# ============================================
puts "Creating formulas..."

Formula.destroy_all

[
  { name: "Entrée/Plat ou Plat/Dessert", description: nil, price: 22, position: 0 },
  { name: "Entrée + Plat + Dessert", description: nil, price: 24, position: 1 }
].each do |item|
  Formula.create!(
    name: item[:name],
    description: item[:description],
    price: item[:price],
    position: item[:position]
  )
end

# ============================================
# BEVERAGES
# ============================================
puts "Creating beverages..."

Beverage.destroy_all

# LES BOISSONS CHAUDES
[
  { name: "Café", price: 2, position: 0 },
  { name: "Décaféiné", price: 2, position: 1 },
  { name: "Café allongé", price: 2, position: 2 },
  { name: "Déca Allongé", price: 2, position: 3 },
  { name: "Double expresso", price: 3.80, position: 4 },
  { name: "Thé", price: 4.50, position: 5 },
  { name: "Café serré", price: 2, position: 6 },
  { name: "Noisette", price: 2.20, position: 7 },
  { name: "Chocolat chaud", price: 4.50, position: 8 },
  { name: "Grand crème", price: 4, position: 9 },
  { name: "Cappuccino", price: 4, position: 10 },
  { name: "Café Latté", price: 5, position: 11 },
  { name: "Chocolat Chamalow", price: 5, position: 12 },
  { name: "Irish Coffee", price: 10, position: 13 },
  { name: "Chocolat Baileys", price: 10, position: 14 }
].each do |item|
  Beverage.create!(
    name: item[:name],
    category: "boisson_chaude",
    price: item[:price],
    position: item[:position],
    active: true
  )
end

# LES SOFTS
[
  { name: "33cl Schweppes, Coca Cola, Perrier", price: 4, position: 0 },
  { name: "25cl Fuzetea, Jus de fruit, Limonade, Orangina", price: 4, position: 1 },
  { name: "33cl Chose", price: 4, position: 2 },
  { name: "50cl Chose", price: 7.50, position: 3 },
  { name: "Bouteille plate et pétillante 50cl", price: 3.60, position: 4 },
  { name: "Bouteille plate et pétillante 1L", price: 4.60, position: 5 }
].each do |item|
  Beverage.create!(
    name: item[:name],
    category: "soft",
    price: item[:price],
    position: item[:position],
    active: true
  )
end

# LES BIÈRES (price_small = 25cl, price_medium = 33cl, price_large = 50cl)
[
  { name: "Loburg", price_small: 3.80, price_medium: 4.50, price_large: 6.50, position: 0 },
  { name: "Leffe", price_small: 4.60, price_medium: 5.60, price_large: 8, position: 1 },
  { name: "Hoegaarden", price_small: 4.60, price_medium: 5.60, price_large: 8.30, position: 2 },
  { name: "Panaché", price_small: 4, price_medium: 5, price_large: 7, position: 3 },
  { name: "Picon Bière", price_small: 4.80, price_medium: 5.80, price_large: 8.50, position: 4 }
].each do |item|
  Beverage.create!(
    name: item[:name],
    category: "biere",
    price_small: item[:price_small],
    price_medium: item[:price_medium],
    price_large: item[:price_large],
    position: item[:position],
    active: true
  )
end

# LES APÉRITIFS
[
  { name: "Ricard/Pastis 4cl", price: 4, position: 0 },
  { name: "Martini 6cl", price: 6, position: 1 },
  { name: "Kir, Coupe de Prosecco 12.5cl", price: 7, position: 2 },
  { name: "Lillet, Campari 6cl", price: 7, position: 3 },
  { name: "Kir Royal au Prosecco 12.5cl", price: 9, position: 4 },
  { name: "Americano 8cl", price: 9, position: 5 }
].each do |item|
  Beverage.create!(
    name: item[:name],
    category: "aperitif",
    price: item[:price],
    position: item[:position],
    active: true
  )
end

# LES COCKTAILS
[
  { name: "Caipirinha", description: "Cachaça, citron vert, cassonade", price: 10, position: 0 },
  { name: "Aperol Spritz", description: "Aperol, Prosecco, eau gazeuse", price: 10, position: 1 },
  { name: "St Germain Spritz", description: "St Germain, Prosecco, eau gazeuse", price: 12, position: 2 },
  { name: "Pina Colada", description: "Rhum, jus d'ananas, coco", price: 10, position: 3 },
  { name: "Kraken Dark'n'Stormy", description: "Rhum, ginger beer, citron vert, cassonade", price: 10, position: 4 },
  { name: "Moscow Mule", description: "Vodka, ginger beer, citron vert, cassonade", price: 10, position: 5 },
  { name: "Tchanqué Gin", description: "Choisissez votre gin et soft !", price: 12, position: 6 },
  { name: "Mojito", description: "Rhum, eau gazeuse, citron vert, cassonade, menthe", price: 10, position: 7 }
].each do |item|
  Beverage.create!(
    name: item[:name],
    category: "cocktail",
    description: item[:description],
    price: item[:price],
    position: item[:position],
    active: true
  )
end

# LES MOCKTAILS
[
  { name: "Virgin Mojito", price: 7, position: 0 },
  { name: "Virgin Pina", price: 7, position: 1 },
  { name: "Virgin Tchanqué", price: 7, position: 2 }
].each do |item|
  Beverage.create!(
    name: item[:name],
    category: "mocktail",
    price: item[:price],
    position: item[:position],
    active: true
  )
end

# LES ALCOOLS
[
  { name: "Manzana, Whisky, Vodka, Gin", price: 6, position: 0 },
  { name: "Get, Menthe Pastille", price: 7, position: 1 },
  { name: "Rhum Vieux, Cognac, Armagnac", price: 9, position: 2 },
  { name: "Jack Daniel's, Single Malt", price: 10, position: 3 }
].each do |item|
  Beverage.create!(
    name: item[:name],
    category: "alcool",
    price: item[:price],
    position: item[:position],
    active: true
  )
end

# ============================================
# EVENTS
# ============================================
puts "Creating events..."

# Use current year for events
current_year = Date.current.year

[
  {
    title: "Soirée Saint-Valentin",
    description: "Menu spécial en amoureux avec vue sur le lac",
    start_date: Date.new(current_year, 2, 14),
    active: true
  },
  {
    title: "Brunch de Pâques",
    description: "Brunch gourmand en famille",
    start_date: Date.new(current_year, 4, 20),
    active: true
  },
  {
    title: "Fermeture exceptionnelle",
    description: "Le restaurant sera fermé pour le 1er mai",
    start_date: Date.new(current_year, 5, 1),
    active: true
  }
].each do |event_data|
  Event.find_or_create_by!(title: event_data[:title], start_date: event_data[:start_date]) do |event|
    event.description = event_data[:description]
    event.active = event_data[:active]
  end
end

puts "Seeding complete!"
puts ""
puts "Summary:"
puts "  - PageContents: #{PageContent.count}"
puts "  - MenuItems: #{MenuItem.count}"
puts "  - WineItems: #{WineItem.count}"
puts "  - Beverages: #{Beverage.count}"
puts "  - Formulas: #{Formula.count}"
puts "  - Events: #{Event.count}"
puts ""
puts "Admin access:"
puts "  URL: /admin"
puts "  Login: admin"
puts "  Password: tchanque2024 (or ADMIN_PASSWORD env variable)"
