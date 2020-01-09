# frozen_string_literal: true

class SleepReportsPresenter < ReportsPresenter
  def self.model
    SleepReport
  end

  def calculate_exp_avg!(alpha:)
    start_date = ordered_by_recency.first.date
    end_date = ordered_by_recency.last.date
    average_duration = 28_800

    # Initializers
    @exp_avg_data = {}
    exp_avg = ordered_by_recency.first.duration.seconds
    accuracy = 0.0

    (start_date..end_date).each do |date|
      if sleep_report = hash_by_date[date]
        exp_avg = alpha * sleep_report.duration.seconds + (1 - alpha) * exp_avg
        accuracy = alpha + (1 - alpha) * accuracy
        @exp_avg_data[sleep_report.id] = { exp_avg: Duration.new(exp_avg), accuracy: accuracy }
      else
        exp_avg = alpha * average_duration + (1 - alpha) * exp_avg
        accuracy = (1 - alpha) * accuracy
      end
    end
  end

  def exp_avg(sleep_report)
    @exp_avg_data.dig(sleep_report.id, :exp_avg)
  end

  def accuracy(sleep_report)
    @exp_avg_data.dig(sleep_report.id, :accuracy)
  end

  private

  def hash_by_date
    @hash_by_date ||=
      ordered_by_recency.completed.map do |sleep_report|
        [sleep_report.date, sleep_report]
      end.to_h
  end
end
