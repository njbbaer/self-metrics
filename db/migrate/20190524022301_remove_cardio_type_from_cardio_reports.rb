# frozen_string_literal: true

class RemoveCardioTypeFromCardioReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :cardio_reports, :cardio_type
  end
end
