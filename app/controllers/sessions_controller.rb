class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password])
    @user ||= User.new
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid username and/or password"]
      render :new
    end

  end
end
