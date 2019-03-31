class CreateWeightReports < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_reports do |t|
      t.datetime :timestamp
      t.float :pounds

      t.timestamps
    end
  end
end
