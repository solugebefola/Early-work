class BandsController < ApplicationController

  def new
    @band = Band.new

    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
    end
  end

  def index
    @bands = Band.all

    render :index
  end

  def show
    @band = Band.find(params[:id])

    render :show
  end

  def edit
    @band = Band.find(params[:id])

    render :edit
  end

  def destroy
  end

  def update
    @band = Band.find(params[:id])
    if @band.update!
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

end
