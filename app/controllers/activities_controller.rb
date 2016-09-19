class ActivitiesController < ApplicationController

  	before_action :authenticate_user!
  	before_action :set_grade
  	before_action :set_activity

  	def show
  	  render(:show, locals: {
        task: @activity.task,
        grade: @grade,
        acivity: @activity,
        track: @activity.task.track
      })
  	end

  	def update
  	   #activity.compile()
  	end

  	private

  		def set_grade
  			@grade = current_user.grades.find(params[:grade_id])
  			authorize @grade
  		end

  		def set_activity
  			@activity = @grade.activities.find(params[:id])
  			authorize @grade
  		end

  		def compile_params
  		end

end