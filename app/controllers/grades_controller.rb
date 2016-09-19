class GradesController < ApplicationController

  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  layout 'dashboard'
  
  def index
    render(:index, locals: {
      grades: Grade.where(user_id: current_user.id)
    })
  end


  def create
    @grade = Grade.new(grade_params)
    @grade.user = current_user
    if @grade.save
      redirect_to [current_user, @grade], notice: 'Grade was successfully created.'
    else
      format.html { render :new }
    end
  end



  private
    
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def grade_params
      params.require(:grade).permit(:track_id, :finished, :finished_at)
    end

    def check_params
      params[:user_id] == 'me'
    end
    
end
