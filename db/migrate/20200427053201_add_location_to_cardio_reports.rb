class AddLocationToCardioReports < ActiveRecord::Migration[6.0]
  def change
    add_column :cardio_reports, :location, :string
  end
end
