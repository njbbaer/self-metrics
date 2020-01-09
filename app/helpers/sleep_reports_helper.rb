# frozen_string_literal: true

module SleepReportsHelper
  def sleep_duration_color_style(duration)
    hours = duration.hours
    normalized =
      if hours > 9 then 1
      elsif hours < 6 then 0
      else (hours - 6) / 3
      end

    red = normalized > 0.5 ? (1 - normalized) * 2 * 255 : 255
    green = normalized < 0.5 ? normalized * 2 * 255 : 255
    "rgb(#{red},#{green},0)"
  end

  def days_since_previous_sleep(sleep_report)
    previous_idx = @sleep_reports.ordered_by_recency.pluck(:id).index(sleep_report.id) - 1
    return nil if previous_idx.negative?

    (sleep_report.date - @sleep_reports.ordered_by_recency[previous_idx].date).to_i
  end
end
