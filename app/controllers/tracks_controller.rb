class TracksController < ApplicationController

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:comments] = ["Track saved!"]
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def new
    @track = Track.new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update!(track_params)
      flash[:comments] = ["Track saved!"]
      render :new
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    redirect_to album_url(@track.album_id)
  end
  private
  def track_params
    params.require(:tracks).permit(:name, :lyrics, :album_id)
  end
end
