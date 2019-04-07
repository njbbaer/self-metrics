# frozen_string_literal: true

class CreateWeightReports < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_reports do |t|
      t.datetime :timestamp
      t.float :weight_pounds

      t.timestamps
    end
  end
end
