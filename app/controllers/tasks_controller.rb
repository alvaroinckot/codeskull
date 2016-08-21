class TasksController < ApplicationController
	# /tracks/:track_id/tasks

	def new
		render(:new, locals: {
	      track: @track,
	      task: Task.new
	    })
	end

	def create
	end

	def delete
	end

	def set_track
		@track = Track.find(params[:track_id]).eager_load(:tasks)
	end

end
