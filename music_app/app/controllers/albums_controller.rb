class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])
    @band = @album.band

    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    @band = @album.band

    if @album.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = [@album.errors.full_messages]
      render :new
    end

  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    @band = @album.band
    redirect_to band_url(@band)
  end

  def update
    @album = Album.find_by(id: params[:id])
    @band = @album.band

    if @album.update(album_params)
      flash.now[:success] = "You updated the Album info"
      redirect_to band_url(@band)
    else
      render :edit
    end

  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :studio, :band_id)
  end

end
