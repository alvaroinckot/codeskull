class Task < ActiveRecord::Base
	enum category: [ :environment, :basic, :application, :service ]
	belongs_to :track
end
