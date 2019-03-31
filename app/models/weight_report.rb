class WeightReport < ApplicationRecord
  validates_presence_of :timestamp, :pounds
  validates_numericality_of :pounds, greater_than: 0.0
end
