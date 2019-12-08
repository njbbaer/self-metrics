# frozen_string_literal: true

class WeightReportsCalculator
  def initialize(weight_reports)
    @weight_reports = weight_reports.ordered_by_recency
  end

  def calculate_exp_avg(alpha:, initial_weight:)
    exp_avg = initial_weight
    @exp_avg_data = @weight_reports.map do |weight_report|
      exp_avg = alpha * weight_report.weight_pounds + (1 - alpha) * exp_avg
      [weight_report.id, exp_avg]
    end.to_h
  end

  def exp_avg(weight_report)
    @exp_avg_data[weight_report.id]
  end

  def exp_avg_table
    @weight_reports.map do |weight_report|
      [weight_report.epoch_timestamp, @exp_avg_data[weight_report.id].round(2)]
    end
  end
end
