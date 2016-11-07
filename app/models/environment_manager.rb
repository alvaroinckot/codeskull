class EnvironmentManager

	def self.get(environment)
		case environment.to_sym
		when :ruby
			return EnvironmentManager::Ruby.new
		when :java
			return EnvironmentManager::Java.new
		else
			throw 'Language not supported!'
		end
	end
end