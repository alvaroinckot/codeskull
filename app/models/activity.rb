class Activity < ActiveRecord::Base

	belongs_to :task
  	belongs_to :grade

  	# code text
  	
  	def verify
  		# log snippet
  		# compile
  		# validate expectations
  		# return the next task or finish
  	end

end
