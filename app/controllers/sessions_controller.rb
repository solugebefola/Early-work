class SessionsController < ApplicationController


  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      sign_in(@user)
      flash[:notice] = "Signed in!"
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  def new
    render :new
  end


end
