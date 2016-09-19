class Activity < ActiveRecord::Base

	belongs_to :task
  	belongs_to :grade

  	def verify
  		# compile
  		# validate expectations
  		# return the next task or finish
  	end

end
