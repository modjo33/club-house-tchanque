class PagesController < ApplicationController
  def home
    set_meta_tags(
      title: "Restaurant Club House Tchanqué - Villenave d'Ornon | Restaurant du Golf",
      description: "Bienvenue au Club House Tchanqué, restaurant du golf de Villenave d'Ornon. Ouvert à tous, découvrez notre carte, notre terrasse avec vue panoramique sur le golf et son lac. Réservations au 09 61 63 15 27.",
      keywords: "restaurant, golf, villenave d'ornon, bordeaux, terrasse, lac, cuisine française, club house, tchanqué",
      og: {
        title: "Restaurant Club House Tchanqué - Villenave d'Ornon",
        description: "Bienvenue au Club House Tchanqué, restaurant du golf de Villenave d'Ornon. Ouvert à tous !",
        url: request.original_url
      },
      twitter: {
        title: "Restaurant Club House Tchanqué - Villenave d'Ornon",
        description: "Restaurant du golf ouvert à tous. Terrasse avec vue sur le golf et le lac."
      }
    )
  end

  def carte
    set_meta_tags(
      title: "La carte du restaurant - Club House Tchanqué",
      description: "Découvrez la carte du restaurant Club House Tchanqué : entrées, plats, desserts, formules du jour et menu enfant. Cuisine de produits frais et de saison à Villenave d'Ornon.",
      keywords: "carte, menu, restaurant, plats, entrées, desserts, formule, villenave d'ornon, cuisine française, produits frais",
      og: {
        title: "La carte du restaurant - Club House Tchanqué",
        description: "Découvrez notre carte : entrées, plats, desserts et formules du jour. Cuisine de produits frais.",
        url: request.original_url
      },
      twitter: {
        title: "La carte - Club House Tchanqué",
        description: "Carte du restaurant avec entrées, plats, desserts et formules. Produits frais et de saison."
      }
    )
  end

  def vins
    set_meta_tags(
      title: "La carte des vins - Club House Tchanqué",
      description: "Notre sélection de vins blancs, rosés, rouges et champagne au Club House Tchanqué. Vins de Bordeaux, Pessac-Léognan, Côtes du Rhône et plus encore.",
      keywords: "carte des vins, vins, bordeaux, pessac-léognan, côtes du rhône, champagne, vin rouge, vin blanc, rosé, restaurant",
      og: {
        title: "La carte des vins - Club House Tchanqué",
        description: "Découvrez notre sélection de vins : Bordeaux, Pessac-Léognan, Côtes du Rhône et champagne.",
        url: request.original_url
      },
      twitter: {
        title: "Carte des vins - Club House Tchanqué",
        description: "Vins blancs, rosés, rouges et champagne. Sélection bordelaise et plus encore."
      }
    )
  end

  def evenements
    set_meta_tags(
      title: "Salle de réunion et événements - Club House Tchanqué",
      description: "Organisez vos réunions, séminaires et événements privés au Club House Tchanqué. Salle Birdie de 40m2 avec vue sur le golf, vidéo-projecteur et wifi. Jusqu'à 30 personnes.",
      keywords: "salle de réunion, séminaire, événements, privatisation, anniversaire, baptême, entreprise, villenave d'ornon, bordeaux, golf",
      og: {
        title: "Salle de réunion et événements - Club House Tchanqué",
        description: "Salle Birdie de 40m2 pour vos réunions et événements. Vue sur le golf, jusqu'à 30 personnes.",
        url: request.original_url
      },
      twitter: {
        title: "Événements - Club House Tchanqué",
        description: "Réunions, séminaires, anniversaires. Salle privative de 40m2 avec vue sur le golf."
      }
    )
  end
end
