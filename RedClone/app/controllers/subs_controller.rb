class SubsController < ApplicationController
  before_action :user_is_mod?, only: [:edit,:update]

  before_action :signed_in?

  def user_is_mod?
    current_user.id == params[:mod_id]
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id
    if @sub.save!
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = "Invalid input"
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      render :show
    else
      flash.now[:errors] = "Invalid edit"
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end


  private
  def sub_params
    params.require(:sub).permit(:title, :description, :mod_id)
  end
end
