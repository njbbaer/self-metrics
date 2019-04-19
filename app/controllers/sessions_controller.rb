# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    if params[:password] == Rails.configuration.password
      session[:authenticated] = true
      redirect_to root_url
    else
      flash[:error] = 'Password is invalid'
      redirect_to '/login'
    end
  end

  def destroy
    session[:authenticated] = false
    redirect_to root_url
  end
end
