# frozen_string_literal: true

module CardioReportsHelper
  def ranking(cardio_report)
    @rank_by_calories.index(cardio_report.id) + 1
  end

  def featured?(cardio_report)
    ranking(cardio_report) <= 10
  end
end
