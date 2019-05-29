# frozen_string_literal: true
# == Schema Information
#
# Table name: cardio_reports
#
#  id               :bigint(8)        not null, primary key
#  datestamp        :date
#  distance_miles   :float
#  duration_seconds :integer
#  treadmill        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CardioReport < ApplicationRecord
  attr_accessor :part_hours, :part_minutes, :part_seconds

  before_validation :calculate_multipart_duration

  validates_presence_of :datestamp
  validates_numericality_of :duration_seconds, greater_than: 0
  validates_numericality_of :distance_miles, greater_than: 0.0

  scope :ordered_by_recency, -> { order(datestamp: :asc) }

  def duration_time
    Time.at(duration_seconds || 0).utc
  end

  def calculate_multipart_duration
    return if duration_seconds_changed?

    self.duration_seconds =
      part_hours.to_i * 3600 +
      part_minutes.to_i * 60 +
      part_seconds.to_i
  end

  def duration_minutes_part
    (duration_seconds / 60).floor
  end

  def duration_seconds_part
    duration_seconds % 60
  end
end
