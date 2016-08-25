class AddLanguageAndIdiomToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :language, :integer
    add_column :tracks, :idiom, :integer
  end
end
