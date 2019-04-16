# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate
  after_action :flash_errors

  private

  def authenticate
    redirect_to '/login' unless session[:authenticated]
  end
end
