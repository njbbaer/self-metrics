# frozen_string_literal: true

class WeightExpAvgCalculator
  def initialize(weight_reports, alpha)
    exp_avg = 0
    @exp_avg_table = weight_reports.ordered_by_recency.map do |weight_report|
      exp_avg = alpha * weight_report.weight_pounds + (1 - alpha) * exp_avg
      [weight_report.id, exp_avg]
    end.to_h
  end

  def fetch(weight_report)
    @exp_avg_table[weight_report.id]
  end
end
