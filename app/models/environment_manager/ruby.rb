class EnvironmentManager::Ruby

	def compile(source)
		uri = URI("http://ruby:4567/")
		params = { :code => source }
		res = Net::HTTP.post_form(uri, params)
		ActiveSupport::JSON.decode(res.body)
	end

end
