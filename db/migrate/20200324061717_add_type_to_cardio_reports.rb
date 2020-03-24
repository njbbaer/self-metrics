# frozen_string_literal: true

class AddTypeToCardioReports < ActiveRecord::Migration[6.0]
  def change
    add_column :cardio_reports, :activity_type, :int

    CardioReport.all.each do |report|
      report.activity_type = report.treadmill? ? 'treadmill' : 'run'
      report.save!
    end

    remove_column :cardio_reports, :treadmill
  end
end
