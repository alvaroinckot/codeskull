class AddTasksToTracks < ActiveRecord::Migration
  def change
  	add_reference :tasks, :track, index: true, foreign_key: true
  end
end
