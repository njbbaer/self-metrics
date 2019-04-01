class CardioReport < ApplicationRecord
  validates_presence_of :finished_at, :seconds, :miles, :cardio_type

  enum cardio_type: { running: 0, cycling: 1, hiking: 2 }
end
