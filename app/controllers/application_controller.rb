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
end
