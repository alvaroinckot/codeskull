class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.text :description
      t.references :users, :owner, index: true
      t.timestamps null: false
    end
  end
end
