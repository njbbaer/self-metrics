# frozen_string_literal: true

module CardioReportsHelper
  def ranking_by_calories(cardio_report)
    sorted_by_calories.pluck(:id).index(cardio_report.id) + 1
  end

  def ranking_by_speed_for_distance(cardio_report)
    sorted_by_speed.select do |cardio| 
      cardio[:distance_miles] >= cardio_report.distance_miles
    end.pluck(:id).index(cardio_report.id) + 1
  end

  def featured_by_calories?(cardio_report)
    ranking_by_calories(cardio_report) <= 10
  end

  def featured_by_speed?(cardio_report)
    ranking_by_speed_for_distance(cardio_report) <= 3
  end

  def featured?(cardio_report)
    featured_by_calories?(cardio_report) || featured_by_speed?(cardio_report)
  end

  def sorted_by_calories
    @sorted_by_calories ||= CardioReport.sorted_by_calories
  end

  def sorted_by_speed
    @sorted_by_speed ||= CardioReport.sorted_by_speed
  end
end
