class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])

    render :show
  end

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
    @bands = Band.all

    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] << "Album added"
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  private
  def album_params
    params.require(:album)
          .permit(:band_id, :live_or_studio)
  end


end
