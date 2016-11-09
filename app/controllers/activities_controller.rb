class ActivitiesController < ApplicationController

  	before_action :authenticate_user!
  	before_action :set_grade
  	before_action :set_activity
    before_action :set_others_ids

  	def show
  	  render(:show, locals: {
        task: @activity.task,
        grade: @grade,
        activity: @activity,
        track: @activity.task.track,
        next_id: @next_id,
        previous_id: @previous_id
      })

  	end

  	def update
      @activity.update(activity_params)
  	  @activity = @activity.compile(activity_params)

      if @activity == nil
        redirect_to '/users/me/grades'
      else
        render(:show, locals: {
          grade: @grade,
          activity: @activity,
          track: @activity.task.track,
          next_id: @next_id,
          previous_id: @previous_id
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

      def set_others_ids
        @next_id = @grade.activities.order(:id).where("id > ?", @activity.id).pluck(:id).first
        @previous_id = @grade.activities.order(id: :desc).where("id < ?", @activity.id).pluck(:id).first
      end

      def activity_params
        params.require(:activity).permit(:source_code)
      end

end