class ActivitiesController < ApplicationController

  	before_action :authenticate_user!
  	before_action :set_grade
  	before_action :set_activity

  	def show
  	  render(:show, locals: {
        task: @activity.task,
        grade: @grade,
        activity: @activity,
        track: @activity.task.track
      })
  	end

  	def update
  	  @activity = @activity.compile(activity_params)

      if @activity == nil
        redirect_to '/users/me/grades'
      else
        render(:show, locals: {
          grade: @grade,
          activity: @activity,
          track: @activity.task.track
        })
      end
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

      def activity_params
        params.require(:activity).permit(:source_code)
      end

end