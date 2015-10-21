class UsersController < ApplicationController
  before_action :require_signed_out, only: [:create, :new]

  def create
    fail
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User #{@user.user_name} created"
      log_in_user!(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    fail
    @user = User.find(params[:id])
    @cats = @user.cats

    render :show
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
