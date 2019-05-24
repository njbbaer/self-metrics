# frozen_string_literal: true

json.extract! cardio_report, :id, :datestamp, :duration_seconds, :distance_miles, :machine, :created_at, :updated_at
json.url cardio_report_url(cardio_report, format: :json)
