# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  rescue_from ActiveRecord::RecordInvalid do |exception|
    flash[:danger] = exception.message
    render :new
  end

  private

  def authenticate
    redirect_to login_path unless cookies.encrypted[:password] == Rails.configuration.password
  end
end
