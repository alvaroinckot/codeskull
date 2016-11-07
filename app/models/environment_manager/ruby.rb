class EnvironmentManager::Ruby

 	# TODO support more operators
	attr_accessor :operators, :var_types

	def initialize
		self.operators = [ "==" , "!=", ">", ">=", "<", "<=" ]
		self.var_types = [ "String" , "Fixnum", "Integer", "Numeric" , "Float"]
	end

	# TODO refactor, modifiy to use faraday
	def compile(source, klass = "", methods = [])
		uri = URI("http://ruby:4567/")
		params = { :code => source }
		res = Net::HTTP.post_form(uri, params)
		ActiveSupport::JSON.decode(res.body)
	end

	# validate the code and the output based on language requirements
	def validate(expectations, source, response)
		validations = response["output"]
	    	.select { |output| output.include? "{" } # todo refactor
	      	.map do |c| 
	        	JSON.parse(c) 
	      	end
	     return validations.count == expectations.count &&
	     	validations.each.all? { |hash| hash[hash.keys.first] == 'true' }
	end

	# pre process the code to print the JSON expectations
	def pre_process(expectations, source)
		final_source = source
		expectations.each do |expectation|
			if expectation.var_type != "String"
				final_source += "\r\n puts  \"{\" + \"\\\"\" + (#{expectation.id}).to_s + \"\\\"\"  + \":\" +  \"\\\"\" + (#{expectation.name} #{expectation.operator} #{expectation.value}).to_s + \"\\\"\"+ \"}\"  "
			else
				final_source += "\r\n puts  \"{\" + \"\\\"\" + (#{expectation.id}).to_s + \"\\\"\"  + \":\" +  \"\\\"\" + (#{expectation.name} #{expectation.operator} \"#{expectation.value}\").to_s + \"\\\"\"+ \"}\"  "
			end
		end unless expectations == nil
		return final_source
	end

end
