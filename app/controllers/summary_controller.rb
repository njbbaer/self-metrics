# frozen_string_literal: true

class SummaryController < ApplicationController
  def index
    flash_weight_report_reminder!
    flash_cardio_report_reminder!
  end

  private

  def flash_weight_report_reminder!
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    flash_message :alert, "#{days_since_latest} days since you last reported your weight"
  end

  def flash_cardio_report_reminder!
    days_since_latest = CardioReport.days_since_latest
    return if days_since_latest < 3

    flash_message :alert, "#{days_since_latest} days since you last reported cardio"
  end
end
