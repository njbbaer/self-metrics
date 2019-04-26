# frozen_string_literal: true

class WeightReport < ApplicationRecord
  validates_presence_of :timestamp, :weight_pounds
  validates_numericality_of :weight_pounds, greater_than: 0.0

  scope :ordered_by_recency, -> { order(timestamp: :asc) }

  def self.current_weight_pounds
    WeightReport.ordered_by_recency.last&.weight_pounds
  end
end
