class ContentsController < ApplicationController

	def destroy
		@content = Content.find(params[:id])
		authorize @content
		@content.destroy
		redirect_to request.referrer
	end

end