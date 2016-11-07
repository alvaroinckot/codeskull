class Sandbox
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :id, :source_code, :console

	def initialize(attributes = {})
	    attributes.each do |name, value|
	      send("#{name}=", value)
	    end
  	end

	def persisted?
		true
	end

	def compile
		response = environment.compile(self.source_code, "App", ["main"])
		if response["output"].length > 0
			self.console +=  "\r\n" + response["output"].join("\r\n")
		end
	end

	def environment
		EnvironmentManager.get(self.id)
	end

end