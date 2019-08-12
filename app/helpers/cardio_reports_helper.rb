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

  def sleep_color_class(sleep_report)
    return 'alert-dark' unless sleep_report.complete?

    case sleep_report.score.round
    when 90..100 then 'alert-success'
    when 70..79  then 'alert-warning'
    when 0..69   then 'alert-danger'
    end
  end
end
