class CarouselImage < ApplicationRecord
  has_one_attached :image

  validates :page, presence: true
  validates :section, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :for_page, ->(page) { where(page: page).order(:section, :position) }
  scope :for_section, ->(page, section) { where(page: page, section: section).order(:position) }
  scope :ordered, -> { order(:page, :section, :position) }

  PAGES = %w[home carte vins evenements].freeze

  # Sections disponibles par page
  SECTIONS = {
    "home" => [
      ["Hero principal", "hero"],
      ["Section Terrasse (galerie)", "terrasse"],
      ["Section Événements (carrousel)", "evenements"]
    ],
    "carte" => [
      ["Hero", "hero"]
    ],
    "vins" => [
      ["Carrousel photos", "main"]
    ],
    "evenements" => [
      ["Carrousel principal", "main"]
    ]
  }.freeze

  def self.page_options
    PAGES.map { |p| [p.capitalize, p] }
  end

  def self.section_options_for(page)
    SECTIONS[page] || [["Principal", "main"]]
  end

  def self.all_section_options
    SECTIONS.flat_map { |page, sections| sections.map { |label, key| ["#{page.capitalize} - #{label}", "#{page}:#{key}"] } }
  end
end
