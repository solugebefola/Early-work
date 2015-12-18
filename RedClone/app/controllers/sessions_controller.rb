class SessionsController < ApplicationController


  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      sign_in(@user)
      flash[:notice] = "Signed in!"
      # redirect_to user_url(@user.id)
      render json: "you're in"
    else
      flash.now[:errors] = "Email password combo invalid"
      render :new
    end
  end

  def destroy
    sign_out
    render :new
  end

  def new
    render :new
  end


end
