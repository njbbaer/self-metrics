# frozen_string_literal: true

# == Schema Information
#
# Table name: cardio_reports
#
#  id               :bigint(8)        not null, primary key
#  date        :date
#  distance_miles   :float
#  duration_seconds :integer
#  treadmill        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CardioReport < ApplicationRecord
  attr_accessor :part_minutes, :part_seconds

  before_validation :calculate_multipart_duration!

  validates_presence_of :date
  validates_inclusion_of :treadmill, in: [true, false]
  validates_numericality_of :duration_seconds, greater_than: 0
  validates_numericality_of :distance_miles, greater_than: 0.0

  scope :ordered_by_recency, -> { order(date: :asc) }
  scope :sorted_by_calories, -> { sort_by(&:calories).reverse }
  scope :sorted_by_speed, -> { sort_by { |c| [-c.speed.round(1), -c.distance_miles] } }

  class << self
    def days_since_latest
      (Date.today - latest.date).to_i
    end

    def latest
      ordered_by_recency.last
    end

    def sum_calories(start_date: Date.today, end_date:)
      where(date: end_date..start_date).map(&:calories).sum
    end
  end

  def duration_time
    Time.at(duration_seconds || 0).utc
  end

  def duration_hours
    return nil unless duration_seconds

    duration_seconds / 3600.0
  end

  def calculate_multipart_duration!
    return unless part_minutes.present?

    self.duration_seconds =
      part_minutes.to_i * 60 +
      part_seconds.to_i || 0
  end

  def speed
    distance_miles / duration_hours
  end

  def calories
    # Formula excludes resting calories
    duration_hours * (met - 1) * 180 / 2.205
  end

  private

  def met
    (speed * 26.822 * 0.2 + 3.5) / 3.5
  end
end
