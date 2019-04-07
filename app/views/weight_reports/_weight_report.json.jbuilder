# frozen_string_literal: true

json.extract! weight_report, :id, :timestamp, :weight_pounds, :created_at, :updated_at
json.url weight_report_url(weight_report, format: :json)
