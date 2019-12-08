# frozen_string_literal: true

module SleepReportsHelper
  def sleep_color_class(sleep_report)
    return 'alert-dark' unless sleep_report.complete?

    case sleep_report.score.round
    when 90..100 then 'alert-success'
    when 70..79  then 'alert-warning'
    when 0..69   then 'alert-danger'
    end
  end

  def days_since_previous_sleep(sleep_report)
    previous_idx = @sleep_reports.ordered_by_recency.pluck(:id).index(sleep_report.id) - 1
    return nil if previous_idx.negative?

    (sleep_report.date - @sleep_reports.ordered_by_recency[previous_idx].date).to_i
  end
end
