class Activity < ActiveRecord::Base

	belongs_to :task
  belongs_to :grade
  
  attr_accessor :console

	def compile(params)
		# log snippet
		# compile
    self.console = "Compilado com sucesso!\n"
		self.completed = true # validate expectations
    self.save
		return self.grade.actual_activity # return the next task or finish
	end

end
