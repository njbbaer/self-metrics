# frozen_string_literal: true

json.array! @sleep_reports, partial: 'sleep_reports/sleep_report', as: :sleep_report
