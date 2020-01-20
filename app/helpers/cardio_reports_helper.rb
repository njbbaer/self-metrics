# frozen_string_literal: true

module CardioReportsHelper
  # def ranking_by_calories(cardio_report)
  #   @cardio_reports.ordered_by_calories.pluck(:id).index(cardio_report.id) + 1
  # end

  # def ranking_by_speed_for_distance(cardio_report)
  #   @cardio_reports.ordered_by_speed.select do |cardio|
  #     cardio[:distance_miles] >= cardio_report.distance_miles
  #   end.pluck(:id).index(cardio_report.id) + 1
  # end

  def featured_by_calories?(report)
    report.ranking_by_calories <= 10
  end

  def featured_by_speed_for_distance?(report)
    report.ranking_by_speed <= 1
  end

  def featured?(report)
    featured_by_calories?(report) || featured_by_speed_for_distance?(report)
  end

  def days_since_previous_cardio(cardio_report)
    previous_idx = @cardio_reports.ordered_by_recency.pluck(:id).index(cardio_report.id) - 1
    return nil if previous_idx.negative?

    (cardio_report.date - @cardio_reports.ordered_by_recency[previous_idx].date).to_i
  end
end
