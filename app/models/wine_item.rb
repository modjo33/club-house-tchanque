class WineItem < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, ->(category) { where(category: category).order(:position) }
  scope :ordered, -> { order(:position) }

  CATEGORIES = %w[blanc rose rouge champagne].freeze

  def self.category_options
    [
      ["Vins blancs", "blanc"],
      ["Vins rosés", "rose"],
      ["Vins rouges", "rouge"],
      ["Champagne", "champagne"]
    ]
  end

  def formatted_glass_price
    glass_price.present? ? "#{glass_price.to_i}€" : "—"
  end

  def formatted_bottle_price
    bottle_price.present? ? "#{bottle_price.to_i}€" : "—"
  end
end
