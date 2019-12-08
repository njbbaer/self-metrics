# frozen_string_literal: true

class SleepReportsPresenter < SimpleDelegator
  def self.all
    new(SleepReport.all)
  end

  def ordered_by_recency
    @ordered_by_recency ||= __getobj__.ordered_by_recency
  end
end
