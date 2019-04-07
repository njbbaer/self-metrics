# frozen_string_literal: true

class CardioReport < ApplicationRecord
  validates_presence_of :finished_at, :duration_seconds, :distance_miles, :cardio_type

  enum cardio_type: { running: 0, cycling: 1, hiking: 2 }

  def duration_time
    Time.at(duration_seconds || 0).utc
  end
end
