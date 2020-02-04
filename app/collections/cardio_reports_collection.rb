# frozen_string_literal: true

class CardioReportsCollection < ReportsCollection
  def model
    CardioReport
  end

  def sum_calories
    collection.map(&:calories).sum
  end

  def calculate_ranking_by_calories!
    collection.each do |report|
      report.ranking_by_calories = model.ordered_by_calories.pluck(:id).index(report.id) + 1
    end
  end

  def calculate_ranking_by_speed_for_distance!
    collection.each do |report|
      report.ranking_by_speed = model.ordered_by_speed.select do |other_report|
        other_report[:distance_miles] >= report.distance_miles
      end.pluck(:id).index(report.id) + 1
    end
  end
end
