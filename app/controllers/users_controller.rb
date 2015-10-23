class UsersController < ApplicationController
  # before_action :require_signed_in

  def new
    @user = User.new

    render :new
  end

  def show
    @user = User.find(params[:id])

    render :show
  end

  def create
    @user = User.new(user_params)
    byebug
    @user.password = params[:password]
    if @user.save
      sign_in!(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages
    end

  end

  def edit
    @user = User.find(params[:id])

    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
