class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    if params[:password] == "password"
      session[:authenticated] = true
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Password is invalid"
      render "new"
    end
  end

  def destroy
    session[:authenticated] = false
    redirect_to root_url, notice: "Logged out!"
  end
end
