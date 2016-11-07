class EnvironmentManager::Java

 	# TODO support more operators
	attr_accessor :operators, :var_types
 
	def initialize
		self.operators = [ "output" ]
		self.var_types = [ "String" ]
	end

	# TODO refactor, modifiy to use faraday
	def compile(source, klass = "", methods = [])
		url = URI("http://java:4568/compile")
		
		params = { code: source, class: klass, method: methods[0] }
		http = Net::HTTP.new(url.host, url.port)

		request = Net::HTTP::Post.new(url)
		request["content-type"] = 'application/x-www-form-urlencoded'
		request["cache-control"] = 'no-cache'
		request.body =  parse_url(params).gsub("+", "%20")

		response = http.request(request)
		ActiveSupport::JSON.decode(response.read_body)
	end

	# validate the code and the output based on language requirements
	def validate(expectations, source, response)
		expectations.all? { |expectation|
			response["output"].any? { |output| output.include? expectation.value }
		}
	end

	# pre process the code if required
	def pre_process(expectations, source)
		source
	end

	private
	
		def parse_url(params)
		  params.collect do |key,val|
		    "#{CGI.escape(key.to_s)}=#{CGI.escape(val)}"
		  end.join('&')
		end

end
