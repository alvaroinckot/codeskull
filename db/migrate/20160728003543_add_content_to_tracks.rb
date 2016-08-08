class AddContentToTracks < ActiveRecord::Migration
  def change
  	add_reference :contents, :track, index: true, foreign_key: true
  end
end
