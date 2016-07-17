class AddUserToTrack < ActiveRecord::Migration
  def change
    add_reference :tracks, :user, index: true, foreign_key: true
  end
end
