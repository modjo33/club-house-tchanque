class CuisineImage < ApplicationRecord
  has_one_attached :image

  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:position) }

  def self.for_carousel
    active.ordered.includes(image_attachment: :blob)
  end
end
