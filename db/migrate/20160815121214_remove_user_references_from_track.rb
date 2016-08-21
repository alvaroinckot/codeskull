class RemoveUserReferencesFromTrack < ActiveRecord::Migration
  def change
    remove_reference :tracks, :user, index: true, foreign_key: true
  end
end
