class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to tracks_url
    else
      flash.now[:errors] = [@track.errors.full_messages]
      render :new
    end

  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @track.destroy
    redirect_to tracks_url
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update(track_params)
      flash.now[:success] = "You updated the track info"
      redirect_to track_url(@track)
    else
      render :edit
    end

  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :ord, :lyrics, :track_type)
  end

end
