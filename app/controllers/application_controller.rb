# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    redirect_to login_path unless cookies.encrypted[:password] == Rails.configuration.password
  end
end
