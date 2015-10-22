class SessionsController < ApplicationController

  def new
  end

  def destroy
    sign_out!(current_user)
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
      )
    if user
      sign_in!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = ["username and/or password does not exist"]
      render :new
    end
  end

end
