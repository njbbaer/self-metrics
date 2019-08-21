# frozen_string_literal: true

class RenameMachineFromCardioReports < ActiveRecord::Migration[5.2]
  def change
    rename_column :cardio_reports, :machine, :treadmill
  end
end
