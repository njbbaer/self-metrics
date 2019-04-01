json.extract! cardio_report, :id, :finished_at, :seconds, :miles, :cardio_type, :machine, :created_at, :updated_at
json.url cardio_report_url(cardio_report, format: :json)
