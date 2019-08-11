# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    if params[:password] == Rails.configuration.password
      cookies.encrypted.permanent[:password] = Rails.configuration.password
      flash[:success] = 'Welcome, you\'ve been authenticated'
      redirect_to root_path
    else
      flash[:danger] = 'Password is invalid'
      redirect_to login_path
    end
  end

  def destroy
    cookies.delete(:password)
    redirect_to login_path
  end
end
