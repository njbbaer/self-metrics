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
  validates :datestamp, presence: true, uniqueness: true
  validates_numericality_of :weight_pounds, greater_than: 0.0

  scope :ordered_by_recency, -> { order(datestamp: :asc) }

  class << self
    def days_since_latest
      (Date.today - latest.datestamp).to_i
    end

    def latest
      ordered_by_recency.last
    end

    def weight_data_table
      ordered_by_recency.map do |weight_report|
        [weight_report.epoch_timestamp, weight_report.weight_pounds]
      end
    end
  end

  def epoch_timestamp
    datestamp.to_time.to_i * 1000
  end
end
