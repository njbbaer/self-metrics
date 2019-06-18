# frozen_string_literal: true

class SummaryController < ApplicationController
  def index
    flash_weight_report_reminder!
  end

  private

  def flash_weight_report_reminder!
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    flash[:alert] = "It's been #{days_since_latest} days since your last weight report"
  end
end
