# frozen_string_literal: true

class ChangeTimestampFromWeightReports < ActiveRecord::Migration[5.2]
  def change
    rename_column :weight_reports, :timestamp, :datestamp
    change_column :weight_reports, :datestamp, :date
  end
end
