class CarouselImage < ApplicationRecord
  has_one_attached :image

  validates :page, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :for_page, ->(page) { where(page: page).order(:position) }
  scope :ordered, -> { order(:position) }

  PAGES = %w[home carte vins evenements].freeze

  def self.page_options
    PAGES.map { |p| [p.capitalize, p] }
  end
end
