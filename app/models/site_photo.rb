# frozen_string_literal: true

class SitePhoto < ApplicationRecord
  has_one_attached :image

  validates :location, presence: true
  validates :location, inclusion: { in: ->(r) { LOCATIONS.keys.map(&:to_s) } }

  scope :for_location, ->(loc) { where(location: loc.to_s).order(:position) }
  scope :ordered, -> { order(:location, :position) }

  # Définition de tous les emplacements photo du site
  LOCATIONS = {
    # Page Accueil
    "home_hero" => {
      label: "Accueil - Hero principal",
      description: "Grande image d'arrière-plan en haut de la page d'accueil",
      type: :single,
      default: "hero/terrasse-vue-lac.jpg"
    },
    "home_lieu" => {
      label: "Accueil - Section Le lieu",
      description: "Photo de la terrasse dans la section 'Au coeur du golf'",
      type: :single,
      default: "hero/terrasse-exterieur.jpg"
    },
    "home_cuisine" => {
      label: "Accueil - Carrousel Cuisine",
      description: "Photos des plats dans la section 'Des produits frais' (carrousel automatique)",
      type: :carousel,
      defaults: ["plats/burger.jpg"]
    },
    "home_terrasse" => {
      label: "Accueil - Galerie Terrasse",
      description: "3 photos de la terrasse et de la salle (galerie horizontale)",
      type: :gallery,
      count: 3,
      defaults: ["hero/vue-golf.jpg", "hero/terrasse-lac.jpg", "salle/salle-interieur.jpg"]
    },
    "home_evenements" => {
      label: "Accueil - Carrousel Événements",
      description: "Photos de la salle de réunion et des événements",
      type: :carousel,
      defaults: ["salle/salle-reunion-01.jpg", "salle/salle-reunion-02.jpg", "salle/table-dressee.jpg", "salle/groupe.jpg"]
    },

    # Page Carte
    "carte_hero" => {
      label: "Carte - Hero",
      description: "Image d'arrière-plan en haut de la page carte",
      type: :single,
      default: "plats/tartare.jpg"
    },

    # Page Vins
    "vins_carousel" => {
      label: "Vins - Carrousel photos",
      description: "Photos de la cave et des vins",
      type: :carousel,
      defaults: ["vins/vins-01.jpg", "vins/vins-02.jpg", "vins/vins-03.jpg", "vins/vins-04.jpg"]
    },

    # Page Événements
    "evenements_carousel" => {
      label: "Événements - Carrousel principal",
      description: "Photos de la salle de réunion Birdie",
      type: :carousel,
      defaults: ["salle/salle-reunion-01.jpg", "salle/salle-reunion-02.jpg", "salle/salle-reunion-03.jpg", "salle/salle-reunion-04.jpg"]
    },
    "evenements_configurations" => {
      label: "Événements - Galerie configurations",
      description: "3 photos des configurations possibles de la salle",
      type: :gallery,
      count: 3,
      defaults: ["salle/table-dressee.jpg", "salle/service.jpg", "salle/groupe.jpg"]
    }
  }.freeze

  def self.location_info(location)
    LOCATIONS[location.to_s]
  end

  def self.grouped_by_page
    {
      "Accueil" => LOCATIONS.select { |k, _| k.start_with?("home_") },
      "Carte" => LOCATIONS.select { |k, _| k.start_with?("carte_") },
      "Vins" => LOCATIONS.select { |k, _| k.start_with?("vins_") },
      "Événements" => LOCATIONS.select { |k, _| k.start_with?("evenements_") }
    }
  end

  def location_info
    LOCATIONS[location]
  end

  def label
    location_info&.dig(:label) || location
  end

  def single?
    location_info&.dig(:type) == :single
  end

  def carousel?
    location_info&.dig(:type) == :carousel
  end

  def gallery?
    location_info&.dig(:type) == :gallery
  end
end
