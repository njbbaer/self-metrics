# frozen_string_literal: true

class SummaryController < ApplicationController
  def index
    flash_weight_report_reminder!
  end

  private

  def flash_weight_report_reminder!
    days_since_last_weight_report = WeightReport.days_since_last_report
    return if days_since_last_weight_report < 3

    flash[:alert] = "It's been #{days_since_last_weight_report} days since your last weight report"
  end
end
