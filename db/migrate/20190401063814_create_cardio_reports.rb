# frozen_string_literal: true

class CreateCardioReports < ActiveRecord::Migration[5.2]
  def change
    create_table :cardio_reports do |t|
      t.datetime :finished_at
      t.integer :duration_seconds
      t.float :distance_miles
      t.integer :cardio_type
      t.boolean :machine

      t.timestamps
    end
  end
end
