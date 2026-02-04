# frozen_string_literal: true

class Event < ApplicationRecord
  has_one_attached :affiche

  validates :title, presence: true
  validates :start_date, presence: true
  validate :end_date_after_start_date

  scope :active, -> { where(active: true) }
  scope :upcoming, -> { where("start_date >= ? OR (end_date IS NOT NULL AND end_date >= ?)", Date.current, Date.current) }
  scope :ordered, -> { order(start_date: :asc) }

  def self.current_events
    active.upcoming.ordered
  end

  def formatted_date
    if end_date.present? && end_date != start_date
      "#{I18n.l(start_date, format: :short)} - #{I18n.l(end_date, format: :short)}"
    else
      I18n.l(start_date, format: :long)
    end
  end

  def short_date
    I18n.l(start_date, format: :short)
  end

  private

  def end_date_after_start_date
    return unless end_date.present? && start_date.present?

    if end_date < start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
end
