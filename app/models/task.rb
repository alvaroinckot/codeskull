class Task < ActiveRecord::Base
	enum category: [ :environment, :basic, :application, :service ]
	belongs_to :track
	has_many :expectations
end
