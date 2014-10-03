class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :redirect_stranger

  def index
    @tracks = Track.all
    render :index
  end

  def show
    set_track
    render :show
  end

  def new
    if params[:track]
      @track = Track.new(track_params)
    else
      @track = Track.new
    end
    render :new
  end

  def edit
    set_track
    render :edit
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update
  end

  def destroy
    @track.destroy
    redirect_to tracks_url
  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:title, :album_id, :lyrics)
    end
end
