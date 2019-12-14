# frozen_string_literal: true

class WeightReportsPresenter < ReportsPresenter
  def self.all
    new(WeightReport.all)
  end

  def latest
    ordered_by_recency.last
  end

  def days_since_latest
    (Date.today - latest.datestamp).to_i
  end

  def calculate_exp_avg!(alpha:, initial_weight:)
    exp_avg = initial_weight
    @exp_avg_data = ordered_by_recency.map do |weight_report|
      exp_avg = alpha * weight_report.weight_pounds + (1 - alpha) * exp_avg
      [weight_report.id, exp_avg]
    end.to_h
  end

  def exp_avg(weight_report)
    @exp_avg_data[weight_report.id]
  end

  def exp_avg_table
    ordered_by_recency.map do |weight_report|
      [weight_report.epoch_timestamp, @exp_avg_data[weight_report.id].round(2)]
    end
  end

  def weight_table
    ordered_by_recency.map do |weight_report|
      [weight_report.epoch_timestamp, weight_report.weight_pounds]
    end
  end

  def ordered_by_recency
    @ordered_by_recency ||= __getobj__.ordered_by_recency
  end
end
