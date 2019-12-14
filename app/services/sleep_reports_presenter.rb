# frozen_string_literal: true

class SleepReportsPresenter < SimpleDelegator
  def self.all
    new(SleepReport.all)
  end

  def latest
    ordered_by_recency.last
  end

  def days_since_latest
    ((Time.now - 6.hours).to_date - latest.date).to_i
  end

  def ordered_by_recency
    @ordered_by_recency ||= __getobj__.ordered_by_recency
  end
end
