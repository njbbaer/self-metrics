# frozen_string_literal: true

class CardioReportsPresenter < ReportsPresenter
  def self.model
    CardioReport
  end

  def sum_calories(start_date: Date.today, end_date:)
    where(date: end_date..start_date).map(&:calories).sum
  end

  def ordered_by_calories
    @ordered_by_calories ||= __getobj__.ordered_by_calories
  end

  def ordered_by_speed
    @ordered_by_speed ||= __getobj__.ordered_by_speed
  end
end
