class EnvironmentManager

	def self.get(environment)
		case environment.to_sym
		when :ruby
			return EnvironmentManager::Ruby.new
		when :javascript
			# return javascript environment
		else
			throw 'Language not supported!'
		end
	end
end