class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.text :description
      t.timestamps null: false
    end
  end
end
