class TasksController < ApplicationController
	
  	before_action :authenticate_user!
  	before_action :set_track
	
	layout 'dashboard'
	
	def index
		render(:index, locals: {
	      track: @track
	    })
	end

	def new
		render(:new, locals: {
	      track: @track,
	      task: Task.new(track: @track)
	    })
	end

	def create
		@task = Task.new(task_params)
		@task.track = @track
		@task.save!
		redirect_to track_tasks_path(@track)
	end

	def delete
	end

	private

		def set_track
			@track = Track.find(params[:track_id])
		end

		def task_params
			params.require(:task).permit(:category, :title, :content, :snippet)
		end

end
