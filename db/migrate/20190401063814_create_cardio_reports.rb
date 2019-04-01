class CreateCardioReports < ActiveRecord::Migration[5.2]
  def change
    create_table :cardio_reports do |t|
      t.datetime :finished_at
      t.integer :seconds
      t.float :miles
      t.integer :cardio_type
      t.boolean :machine

      t.timestamps
    end
  end
end
