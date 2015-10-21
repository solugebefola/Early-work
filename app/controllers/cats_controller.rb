class CatsController < ApplicationController
before_action :owned_by_user, only: [:edit, :update]

  def index
    @cats = Cat.all

    render :index

  end

  def show
    @cat = Cat.find(params[:id])
    @cat_r_r = @cat.cat_rental_requests.order(:start_date)
    render :show
  end

  def new
    @cat = Cat.new

    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save!
      redirect_to cat_url(@cat.id)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update!(cat_params)
      redirect_to cat_url(@cat.id)
    else
      render :edit
    end
  end



  private
  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :birth_date, :description)
  end

  
end
