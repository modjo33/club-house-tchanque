class PagesController < ApplicationController
  def home
    @page_title = "Restaurant Club House Tchanqué - Villenave d'Ornon | Restaurant du Golf"
    @page_description = "Bienvenue au Club House Tchanqué, restaurant du golf de Villenave d'Ornon. Ouvert à tous, découvrez notre carte, notre terrasse avec vue panoramique sur le golf et son lac. Réservations au 09 61 63 15 27."
    @page_keywords = "restaurant, golf, villenave d'ornon, bordeaux, terrasse, lac, cuisine française, club house, tchanqué"
  end

  def carte
    @page_title = "La carte du restaurant - Club House Tchanqué"
    @page_description = "Découvrez la carte du restaurant Club House Tchanqué : entrées, plats, desserts, formules du jour et menu enfant. Cuisine de produits frais et de saison à Villenave d'Ornon."
    @page_keywords = "carte, menu, restaurant, plats, entrées, desserts, formule, villenave d'ornon, cuisine française, produits frais"
  end

  def vins
    @page_title = "La carte des vins - Club House Tchanqué"
    @page_description = "Notre sélection de vins blancs, rosés, rouges et champagne au Club House Tchanqué. Vins de Bordeaux, Pessac-Léognan, Côtes du Rhône et plus encore."
    @page_keywords = "carte des vins, vins, bordeaux, pessac-léognan, côtes du rhône, champagne, vin rouge, vin blanc, rosé, restaurant"
  end

  def evenements
    @page_title = "Salle de réunion et événements - Club House Tchanqué"
    @page_description = "Organisez vos réunions, séminaires et événements privés au Club House Tchanqué. Salle Birdie de 40m2 avec vue sur le golf, vidéo-projecteur et wifi. Jusqu'à 30 personnes."
    @page_keywords = "salle de réunion, séminaire, événements, privatisation, anniversaire, baptême, entreprise, villenave d'ornon, bordeaux, golf"
  end
end
