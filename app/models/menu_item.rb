class MenuItem < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, ->(category) { where(category: category).order(:position) }
  scope :ordered, -> { order(:position) }

  CATEGORIES = %w[entrees plats desserts].freeze

  def self.category_options
    [
      ["Entrées", "entrees"],
      ["Plats", "plats"],
      ["Desserts", "desserts"]
    ]
  end

  def formatted_price
    "#{price.to_i}€"
  end
end
