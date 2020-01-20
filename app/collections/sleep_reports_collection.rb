# frozen_string_literal: true

class SleepReportsCollection < ReportsCollection
  def model
    SleepReport
  end

  def calculate_exp_avg!(alpha:)
    avg_duration = 28_800
    exp_avg = 28_800
    accuracy = 0.0

    @exp_avg_data = {}
    (first.date..latest.date).each do |date|
      report = hash_by_date[date]
      if report&.complete?
        exp_avg = alpha * report.duration.seconds + (1 - alpha) * exp_avg
        accuracy = alpha + (1 - alpha) * accuracy
        report.exp_avg = Duration.new(exp_avg)
        report.exp_avg_accuracy = accuracy
      else
        exp_avg = alpha * avg_duration + (1 - alpha) * exp_avg
        accuracy = (1 - alpha) * accuracy
      end
    end
  end

  private

  def hash_by_date
    @hash_by_date ||=
      ordered_by_recency.map do |report|
        [report.date, report]
      end.to_h
  end
end
