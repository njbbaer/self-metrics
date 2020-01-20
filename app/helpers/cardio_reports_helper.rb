# frozen_string_literal: true

module CardioReportsHelper
  def days_since_previous_cardio(cardio_report)
    previous_idx = @cardio_reports.ordered_by_recency.pluck(:id).index(cardio_report.id) - 1
    return nil if previous_idx.negative?

    (cardio_report.date - @cardio_reports.ordered_by_recency[previous_idx].date).to_i
  end
end
