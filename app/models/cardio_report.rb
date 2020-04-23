# frozen_string_literal: true

# == Schema Information
#
# Table name: cardio_reports
#
#  id                  :bigint           not null, primary key
#  activity_type       :integer
#  date                :date
#  distance_miles      :float
#  duration_seconds    :integer
#  elevation_gain_feet :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class CardioReport < ApplicationRecord
  enum activity_type: %i[run_outdoors run_treadmill hike]

  attr_accessor :part_minutes, :part_seconds
  attr_accessor :ranking_by_calories, :ranking_by_speed
  attr_accessor :days_since_previous

  before_validation :calculate_multipart_duration!

  validates_presence_of :date
  validates_inclusion_of :activity_type, in: activity_types.keys
  validates_numericality_of :duration_seconds, greater_than: 0, unless: :hike?
  validates_absence_of :duration_seconds, if: :hike?
  validates_numericality_of :distance_miles, greater_than: 0.0

  scope :ordered_by_recency, -> { order(date: :asc) }
  scope :ordered_by_calories, -> { sort_by(&:calories).reverse }
  scope :ordered_by_speed, -> { sort_by { |c| [-c.speed.round(1), -c.distance_miles] } }

  def duration
    if hike?
      Duration.new(distance_miles / 2.5 * 3600)
    else
      Duration.new(duration_seconds) if duration_seconds
    end
  end

  def calculate_multipart_duration!
    return unless part_minutes.present?

    self.duration_seconds =
      part_minutes.to_i * 60 +
      part_seconds.to_i || 0
  end

  def speed
    if hike?
      2.5
    else
      distance_miles / duration.hours
    end
  end

  def calories
    duration.hours * (met - 1) * 180 / 2.205
  end

  def featured_by_calories?
    ranking_by_calories&. <= 10
  end

  def featured_by_speed_for_distance?
    ranking_by_speed&. <= 1
  end

  def featured?
    featured_by_calories? || featured_by_speed_for_distance?
  end

  def run?
    run_outdoors? || run_treadmill?
  end

  def elevation_grade
    elevation_gain_feet &./ (distance_miles * 5280 / 2)
  end

  private

  def met
    if run?
      (speed * 26.822 * 0.2 + 3.5) / 3.5
    elsif hike?
      6
    end
  end
end
