# frozen_string_literal: true

module CardioReportsHelper
  def ranking_by_calories(cardio_report)
    @sort_by_calories.pluck(:id).index(cardio_report.id) + 1
  end

  def featured?(cardio_report)
    ranking_by_calories(cardio_report) <= 10
  end
end
