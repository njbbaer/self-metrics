# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    redirect_to '/login' unless session[:authenticated]
  end

  def flash_message(type, text)
    flash[type] ||= []
    flash[type] << text
  end

  def flash_weight_report_reminder
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    flash_message :alert, "It's been #{days_since_latest} days since you last recorded your weight"
  end

  def flash_cardio_report_reminder
    days_since_latest = CardioReport.days_since_latest
    return if days_since_latest < 3

    flash_message :alert, "It's been #{days_since_latest} days since you last went running"
  end
end
