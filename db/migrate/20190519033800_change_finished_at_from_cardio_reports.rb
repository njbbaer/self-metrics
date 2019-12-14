# frozen_string_literal: true

class ChangeFinishedAtFromCardioReports < ActiveRecord::Migration[5.2]
  def change
    rename_column :cardio_reports, :finished_at, :date
    change_column :cardio_reports, :date, :date
  end
end
