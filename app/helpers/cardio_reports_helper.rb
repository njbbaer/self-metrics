# frozen_string_literal: true

module CardioReportsHelper
  def ranking_by_calories(cardio_report)
    @sorted_by_calories.pluck(:id).index(cardio_report.id) + 1
  end

  def ranking_by_speed_for_distance(cardio_report)
    @sorted_by_speed.select do |cardio|
      cardio[:distance_miles] >= cardio_report.distance_miles
    end.pluck(:id).index(cardio_report.id) + 1
  end

  def featured_by_calories?(cardio_report)
    ranking_by_calories(cardio_report) <= 10
  end

  def featured_by_speed?(cardio_report)
    ranking_by_speed_for_distance(cardio_report) <= 1
  end

  def featured?(cardio_report)
    featured_by_calories?(cardio_report) || featured_by_speed?(cardio_report)
  end

  def days_since_previous(cardio_report)
    previous_idx = @ordered_by_recency.pluck(:id).index(cardio_report.id) - 1
    return nil if previous_idx.negative?

    (cardio_report.datestamp - @ordered_by_recency[previous_idx].datestamp).to_i
  end
end
