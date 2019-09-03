# frozen_string_literal: true

class RoundTimestampsFromSleepReports < ActiveRecord::Migration[6.0]
  def change
    SleepReport.find_each do |sleep_report|
      sleep_report.update!(
        asleep_at: sleep_report.asleep_at.beginning_of_minute,
        wakeup_at: sleep_report.wakeup_at.beginning_of_minute
      )
    end
  end
end
