class UsersTracks < ActiveRecord::Migration
  def change
  	 create_join_table :users, :tracks do |t|
      t.index :user_id
      t.index :track_id
    end
  end
end
