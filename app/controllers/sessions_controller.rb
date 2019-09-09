# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    if params[:password] == Rails.configuration.password
      cookies.encrypted.permanent[:password] = Rails.configuration.password
      flash[:success] = 'You have authenticated successfully'
      redirect_to root_path
    else
      flash[:danger] = 'Authentication failed'
      redirect_to login_path
    end
  end

  def destroy
    cookies.delete(:password)
    flash[:danger] = 'You have been logged out'
    redirect_to login_path
  end
end
