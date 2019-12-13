# frozen_string_literal: true

module SleepReportsHelper
  def sleep_color_class(sleep_report)
    return 'alert-dark' unless sleep_report.complete?

    case sleep_report.duration_seconds / 3600
    when 8..99 then 'alert-success'
    when 7..8  then 'alert-warning'
    when 0..7  then 'alert-danger'
    end
  end

  def days_since_previous_sleep(sleep_report)
    previous_idx = @sleep_reports.ordered_by_recency.pluck(:id).index(sleep_report.id) - 1
    return nil if previous_idx.negative?

    (sleep_report.date - @sleep_reports.ordered_by_recency[previous_idx].date).to_i
  end
end
