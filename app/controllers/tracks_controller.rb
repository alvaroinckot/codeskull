class TracksController < ApplicationController

  before_action :authenticate_user!
	
  layout 'dashboard'

  def index
    render(:index, layout: false, locals: {
	    tracks: Track.search(search_params[:q]),
	  })
  end

  def new
    render(:new, locals: {
      track: Track.new
    })
  end

  def create
    @track = Track.new(track_params)
    if @track.save  
      redirect_to '/' # should redirect to create new tasks
    end
  end

  def show
  end

  def edit
  end

  private

  def set_track
  	@track = Track.find(params[:id])
  end

  def track_params
  	params.require(:track).permit(:title, :description)
  end

  def search_params
    params.permit(:q)
  end
	
end
