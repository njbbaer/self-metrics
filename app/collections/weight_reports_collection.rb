# frozen_string_literal: true

class WeightReportsCollection < ReportsCollection
  def model
    WeightReport
  end

  def calculate_exp_avg!(alpha:, initial_weight:)
    exp_avg = initial_weight
    ordered_by_recency.map do |weight_report|
      exp_avg = alpha * weight_report.weight_pounds + (1 - alpha) * exp_avg
      weight_report.exp_avg = exp_avg
    end
  end

  def exp_avg_table
    ordered_by_recency.map do |weight_report|
      [weight_report.epoch_timestamp, weight_report.exp_avg.round(2)]
    end
  end

  def weight_table
    ordered_by_recency.map do |weight_report|
      [weight_report.epoch_timestamp, weight_report.weight_pounds]
    end
  end
end
