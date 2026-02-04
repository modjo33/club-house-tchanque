# frozen_string_literal: true

class Beverage < ApplicationRecord
  CATEGORIES = {
    "boisson_chaude" => "Les Boissons Chaudes",
    "soft" => "Les Softs",
    "biere" => "Les Bières",
    "aperitif" => "Les Apéritifs",
    "cocktail" => "Les Cocktails",
    "mocktail" => "Les Mocktails",
    "alcool" => "Les Alcools"
  }.freeze

  validates :category, presence: true, inclusion: { in: CATEGORIES.keys }
  validates :name, presence: true

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:position) }
  scope :by_category, ->(cat) { where(category: cat).ordered }

  def self.grouped_by_category
    CATEGORIES.keys.each_with_object({}) do |cat, hash|
      items = by_category(cat).active
      hash[cat] = items if items.any?
    end
  end

  def self.category_options
    CATEGORIES.map { |key, label| [label, key] }
  end

  def category_label
    CATEGORIES[category] || category
  end

  def has_multiple_sizes?
    price_small.present? || price_medium.present? || price_large.present?
  end

  def display_price
    return price if price.present?
    price_medium || price_small || price_large
  end
end
