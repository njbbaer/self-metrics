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
  attr_accessor :ranking_by_calories, :ranking_by_speed

  before_validation :calculate_multipart_duration!

  validates_presence_of :date
  validates_inclusion_of :treadmill, in: [true, false]
  validates_numericality_of :duration_seconds, greater_than: 0
  validates_numericality_of :distance_miles, greater_than: 0.0

  scope :ordered_by_recency, -> { order(date: :asc) }
  scope :ordered_by_calories, -> { sort_by(&:calories).reverse }
  scope :ordered_by_speed, -> { sort_by { |c| [-c.speed.round(1), -c.distance_miles] } }

  def duration
    Duration.new(duration_seconds) if duration_seconds
  end

  def calculate_multipart_duration!
    return unless part_minutes.present?

    self.duration_seconds =
      part_minutes.to_i * 60 +
      part_seconds.to_i || 0
  end

  def speed
    distance_miles / duration.hours
  end

  def calories
    # Formula excludes resting calories
    duration.hours * (met - 1) * 180 / 2.205
  end

  private

  def met
    (speed * 26.822 * 0.2 + 3.5) / 3.5
  end
end
