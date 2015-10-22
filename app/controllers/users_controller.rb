class UsersController < ApplicationController

  # def new
  #   @user = User.new
  #
  #   render :new
  # end

  def sign_up
    @user = User.new

    render :new
  end

  def show
    @user = User.find(params[:id])

    render :show
  end

  def create
    @user = User.new(user_params)
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
    @users = User.all

    render :index
  end

  def update

  end

  def edit
    @user = User.find(params[:id])

    ###not done
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
