class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      flash[:notice] = "Welcome to da clone"
      render json: "You're in"
      # redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
    end

  end

  def edit
    
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:email,:password)
    end

end
