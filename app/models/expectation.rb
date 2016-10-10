class Expectation < ActiveRecord::Base
  belongs_to :task

  # TODO add support to many languages
  def to_code
  	"\r\n puts  \"{\" + " +
  	"\"\\\"\" + (#{self.id}).to_s + \"\\\"\"  " + 
  	"+ \":\" +  " +
  	"\"\\\"\" + (#{self.name} #{self.operator} #{self.value}).to_s + " +
  	"\"\\\"\"+ \"}\"  "
  end

end
