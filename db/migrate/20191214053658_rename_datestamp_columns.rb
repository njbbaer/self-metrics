# frozen_string_literal: true

class RenameDatestampColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :cardio_reports, :datestamp, :date
    rename_column :weight_reports, :datestamp, :date
  end
end
