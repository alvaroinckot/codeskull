class Expectation < ActiveRecord::Base
  
  belongs_to :task

  def to_text
  	return "#{self.var_type} #{self.name} #{self.operator} #{self.value}"
  end

end
