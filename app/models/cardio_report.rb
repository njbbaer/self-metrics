class CardioReport < ApplicationRecord
  validates_presence_of :finished_at, :duaration_seconds, :distance_miles, :cardio_type

  enum cardio_type: { running: 0, cycling: 1, hiking: 2 }
end
