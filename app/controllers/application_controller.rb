# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    redirect_to login_path unless cookies.encrypted[:password] == Rails.configuration.password
  end

  def flash_message(type, text)
    flash[type] ||= []
    flash[type] << text
  end

  def flash_weight_report_reminder
    days_since_latest = WeightReport.days_since_latest
    return if days_since_latest < 3

    flash_message :alert, "You last recorded your weight #{days_since_latest} days ago"
  end

  def flash_cardio_report_reminder
    days_since_latest = CardioReport.days_since_latest
    return if days_since_latest < 3

    flash_message :alert, "You last went running #{days_since_latest} days ago"
  end
end
