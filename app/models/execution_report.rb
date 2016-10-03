class ExecutionReport

	attr_accessor :success, :output, :commands, :count

	def initialize
		self.success = true
		self.output = ""
		self.commands = []
		self.count = 0
	end

	def counter
		self.count += 1
	end
end