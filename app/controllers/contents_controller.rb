class ContentsController < ApplicationController

  	before_action :authenticate_user!

	def destroy
		@content = Content.find(params[:id])
		authorize @content
		@content.destroy
		redirect_to request.referrer
	end

end