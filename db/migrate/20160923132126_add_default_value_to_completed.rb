class AddDefaultValueToCompleted < ActiveRecord::Migration
	def up
	  change_column :activities, :completed, :boolean, :default => false
	end

	def down
	  change_column :activities, :completed, :boolean, :default => nil
	end
end
