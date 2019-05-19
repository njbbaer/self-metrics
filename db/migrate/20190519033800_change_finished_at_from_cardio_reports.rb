class ChangeFinishedAtFromCardioReports < ActiveRecord::Migration[5.2]
  def change
    rename_column :cardio_reports, :finished_at, :datestamp
    change_column :cardio_reports, :datestamp, :date
  end
end
