class SandboxController < ApplicationController

	before_action :authenticate_user!

	before_action :set_sandbox, only: [ :update ]

	
	def show
	  render(:show, locals: {
	  	sandbox: Sandbox.new(id: params[:id])
      })
	end

	def update
	  @sandbox.compile
	  render(:show, locals: {
	    sandbox: @sandbox
      })
	end


	private

		def sandbox_params
			params.require(:sandbox).permit(:id, :source_code, :console)
		end

		def set_sandbox
			@sandbox = Sandbox.new(sandbox_params)
		end
	
end
