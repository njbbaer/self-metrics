# frozen_string_literal: true

# == Schema Information
#
# Table name: cardio_reports
#
#  id               :bigint(8)        not null, primary key
#  cardio_type      :integer
#  distance_miles   :float
#  duration_seconds :integer
#  finished_at      :datetime
#  machine          :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CardioReport < ApplicationRecord
  attr_accessor :part_hours, :part_minutes, :part_seconds

  before_validation :calculate_multipart_duration

  validates_presence_of :finished_at, :cardio_type
  validates_numericality_of :duration_seconds, greater_than: 0
  validates_numericality_of :distance_miles, greater_than: 0.0

  enum cardio_type: { running: 0, cycling: 1, hiking: 2 }

  scope :ordered_by_recency, -> { order(finished_at: :asc) }

  def duration_time
    Time.at(duration_seconds || 0).utc
  end

  def calculate_multipart_duration
    return if duration_seconds.present?

    self.duration_seconds = part_hours.to_i * 3600 +
                            part_minutes.to_i * 60 +
                            part_seconds.to_i
  end
end
