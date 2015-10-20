class CatRentalRequestsController < ApplicationController
  def new
    @cat_rental_request = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_r_r = CatRentalRequest.new(cat_rental_request_params)

    if @cat_r_r.save!
      redirect_to cat_url(@cat_r_r.cat_id)
    else
      render :new
    end
  end


  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
