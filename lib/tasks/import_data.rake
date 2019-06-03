# frozen_string_literal: true

require 'json'

namespace :import_data do
  task google_fit_weight_json: :environment do
    data_hash = JSON.parse(File.read('google_fit_weight_data.json'))
    ActiveRecord::Base.transaction do
      data_hash['point'].each do |point|
        datestamp = Time.at(point['startTimeNanos'].to_i / 1_000_000_000).to_date
        weight_pounds = point['value'][0]['fpVal'].to_f * 2.20462
        unless WeightReport.exists?(datestamp: datestamp)
          WeightReport.create!(datestamp: datestamp, weight_pounds: weight_pounds)
        end
      end
    end
  end
end