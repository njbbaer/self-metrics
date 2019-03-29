json.extract! sleep_report, :id, :asleep_at, :wakeup_at, :created_at, :updated_at
json.url sleep_report_url(sleep_report, format: :json)
