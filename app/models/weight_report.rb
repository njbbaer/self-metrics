# frozen_string_literal: true
# == Schema Information
#
# Table name: weight_reports
#
#  id            :bigint(8)        not null, primary key
#  datestamp     :date
#  weight_pounds :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WeightReport < ApplicationRecord
  validates_presence_of :datestamp
  validates_numericality_of :weight_pounds, greater_than: 0.0

  scope :ordered_by_recency, -> { order(datestamp: :asc) }

  def self.current_weight_pounds
    WeightReport.ordered_by_recency.last&.weight_pounds || 0
  end
end
