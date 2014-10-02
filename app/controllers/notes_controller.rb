class NotesController < ApplicationController
  before_action :redirect_non_author, only: [:destroy, :edit]

  def new
    @note = Note.new(track_id: params[:track_id])
    render :new
  end

  def create
    @note = Note.new(note_params)
    @note.track_id = params[:track_id]
    @note.user_id = current_user.id

    if @note.save
      redirect_to track_url(@note.track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.nil?
      redirect_to tracks_url
    elsif @note.user_id == current_user.id
      track = @note.track
      @note.destroy
      redirect_to track_url(track)
    else
      render text: "403 FORBIDDEN"
    end
  end

  private
  def note_params
    params.require(:note).permit(:body)
  end

  def redirect_non_author
    redirect_to tracks_url unless current_user.id == @note.id
  end
end
