# frozen_string_literal: true

module CardioReportsHelper
  def ranking_by_calories(cardio_report)
    @cardio_reports.ordered_by_calories.pluck(:id).index(cardio_report.id) + 1
  end

  def ranking_by_speed_for_distance(cardio_report)
    @cardio_reports.ordered_by_speed.select do |cardio|
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

  def part_minutes(cardio_report)
    return nil unless cardio_report.duration_seconds

    (cardio_report.duration_seconds / 60.0).floor
  end

  def part_seconds(cardio_report)
    return nil unless cardio_report.duration_seconds

    (cardio_report.duration_seconds % 60.0).floor
  end

  def days_since_previous_cardio(cardio_report)
    previous_idx = @cardio_reports.ordered_by_recency.pluck(:id).index(cardio_report.id) - 1
    return nil if previous_idx.negative?

    (cardio_report.date - @cardio_reports.ordered_by_recency[previous_idx].date).to_i
  end
end
