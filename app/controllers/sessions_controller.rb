class SessionsController < ApplicationController


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name],params[:user][:password])
    if @user
      log_in_user!(@user)
    else
      flash[:errors] = ["User name or Password is invalid"]
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
