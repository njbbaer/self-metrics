class CreateSleepReports < ActiveRecord::Migration[5.2]
  def change
    create_table :sleep_reports do |t|
      t.datetime :asleep_at
      t.datetime :wakeup_at

      t.timestamps
    end
  end
end
