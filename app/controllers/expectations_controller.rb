class ExpectationsController < ApplicationController

  	before_action :authenticate_user!
  	before_action :set_track
  	before_action :set_task
    before_action :set_expectation, only: [ :update ]

  	def index
  	  	render(:index, layout: false, locals: {
	        task: @task,
	        track: @track,
	        expectations: @task.expectations
      	})
  	end

  	def new
  		render(:_form, layout: false, locals: {
	     task: @task,
	     track: @track,
	     expectation: Expectation.new
      })
  	end

  	def create
  		@expectation = Expectation.create(expectation_params)
  		@task.expectations << @expectation
  		render(:_form, layout: false, locals: {
	      task: @task,
	      track: @track,
	      expectation: @expectation
      })
  	end

    def update
      render(:_form, layout: false, locals: {
        task: @task,
        track: @track,
        expectation: Expectation.new(expectation_params)
      })
    end

  	private

      def set_expectation
        @expectation = @task.expectations.find(params[:id])
      end

  		def set_task
  			@task = @track.tasks.find(params[:task_id])
  		end

  		def set_track
  			@track = Track.find(params[:track_id])
  		end

  		def expectation_params
  			params.require(:expectation).permit(:var_type, :value, :operator, :name)
  		end

end