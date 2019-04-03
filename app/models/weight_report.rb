class WeightReport < ApplicationRecord
  validates_presence_of :timestamp, :weight_pounds
  validates_numericality_of :weight_pounds, greater_than: 0.0
end
