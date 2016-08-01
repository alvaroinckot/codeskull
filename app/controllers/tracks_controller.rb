class TracksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_track, only: [:show, :edit, :update]
	
  layout 'dashboard'

  def index
    render(:index, layout: false, locals: {
	    tracks: Track.search(search_params[:q]).records,
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
      
      params[:attachments].each { |attachment|
          @track.contents.create(file: attachment)
      }
      
      redirect_to '/' # should redirect to create new tasks
    end
  end

  def show
    render(:show, locals: {
      track: @track,
    })
  end

  def edit
    render(:edit, locals: {
      track: @track,
    })
  end

  def update
    if @track.update(track_params)
      params[:attachments].each { |attachment|
        @track.contents.create(file: attachment)
      }
      redirect_to track_url(@track)
    end
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
