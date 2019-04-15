# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    unless session[:authenticated]
      redirect_to '/login'
    end
  end
end
