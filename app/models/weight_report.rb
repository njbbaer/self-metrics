# frozen_string_literal: true

# == Schema Information
#
# Table name: weight_reports
#
#  id            :integer          not null, primary key
#  date          :date
#  weight_pounds :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WeightReport < ApplicationRecord
  attr_accessor :exp_avg

  validates :date, presence: true, uniqueness: true
  validates_numericality_of :weight_pounds, greater_than: 0.0

  def epoch_timestamp
    date.to_time.to_i * 1000
  end
end
