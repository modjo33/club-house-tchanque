class Formula < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(:position) }

  def formatted_price
    if price == price.to_i
      "#{price.to_i} €"
    else
      "#{price.to_s.gsub('.', ',')} €"
    end
  end
end
