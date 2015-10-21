class SessionsController < ApplicationController


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name],params[:user][:password])
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to cats_url
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
