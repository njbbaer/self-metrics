class AddElevationGainToCardioReports < ActiveRecord::Migration[6.0]
  def change
    add_column :cardio_reports, :elevation_gain_feet, :int
  end
end
