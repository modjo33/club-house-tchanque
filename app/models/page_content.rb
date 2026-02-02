class PageContent < ApplicationRecord
  validates :slug, presence: true, uniqueness: true

  SLUGS = %w[home_presentation evenements_salle evenements_formules evenements_prive].freeze

  def self.slug_options
    [
      ["Accueil - Présentation", "home_presentation"],
      ["Événements - Salle de réunion", "evenements_salle"],
      ["Événements - Formules réunion", "evenements_formules"],
      ["Événements - Événement privé", "evenements_prive"]
    ]
  end

  def self.get(slug)
    find_by(slug: slug)
  end
end
