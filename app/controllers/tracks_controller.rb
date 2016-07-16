class TracksController < ApplicationController

  before_action :authenticate_user!
	
  layout false

  def index
    render(:index, locals: {
	  tracks: Track.search(search_params[:q]),
	})
  end

  private

  def set_track
  	@track = Track.find(params[:id])
  end

  def track_params
  	params.require(:track).permit(:title)
  end

  def search_params
    params.permit(:q)
  end
	
end
