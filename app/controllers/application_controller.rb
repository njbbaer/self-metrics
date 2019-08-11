# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  # Flash these errors to the user
  rescue_from ActiveRecord::RecordInvalid, with: :flash_error

  private

  def flash_error(exception)
    flash[:danger] = exception.message
    redirect_back(fallback_location: root_path)
  end

  def authenticate
    redirect_to login_path unless cookies.encrypted[:password] == Rails.configuration.password
  end
end
