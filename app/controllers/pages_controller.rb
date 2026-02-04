class PagesController < ApplicationController
  def home
    @page_title = "Restaurant Club House Tchanqué | Villenave d'Ornon | Vue sur le Golf"
    @page_description = "Restaurant ouvert à tous au cœur du golf de Villenave d'Ornon. Cuisine maison, produits frais, grande terrasse avec vue panoramique sur le lac. Réservations : 09 61 63 15 27"
    @page_keywords = "restaurant villenave d'ornon, restaurant golf bordeaux, terrasse vue lac, cuisine maison bordeaux"
  end

  def carte
    @page_title = "La Carte | Restaurant Club House Tchanqué | Villenave d'Ornon"
    @page_description = "Découvrez notre carte : entrées, plats du jour, desserts maison. Formules midi à partir de 15€. Cuisine de saison avec produits frais."
    @page_keywords = "carte restaurant, menu villenave d'ornon, plat du jour, formule midi, cuisine de saison"
  end

  def vins
    @page_title = "Carte des Vins | Restaurant Club House Tchanqué"
    @page_description = "Notre sélection de vins : Bordeaux, Pessac-Léognan, Côtes du Rhône. Vins au verre ou à la bouteille."
    @page_keywords = "carte des vins, vins bordeaux, pessac-léognan, côtes du rhône, vin au verre"
  end

  def boissons
    @page_title = "Carte des Boissons & Cocktails | Club House Tchanqué"
    @page_description = "Cocktails, bières, boissons chaudes et softs. Mojito, Spritz, cafés italiens. Bar ouvert toute la journée."
    @page_keywords = "cocktails, bières, boissons chaudes, mojito, spritz, café, bar villenave d'ornon"
    @beverages = Beverage.grouped_by_category
  end

  def evenements
    @page_title = "Événements & Séminaires | Salle de réunion | Club House Tchanqué"
    @page_description = "Organisez vos événements : mariages, séminaires, anniversaires. Salle privative 40m², jusqu'à 30 personnes, vue sur le golf."
    @page_keywords = "salle de réunion, séminaire bordeaux, salle privative, mariage golf, événements villenave d'ornon"
  end
end
