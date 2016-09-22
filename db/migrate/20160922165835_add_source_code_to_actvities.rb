class AddSourceCodeToActvities < ActiveRecord::Migration
  def change
    add_column :activities, :source_code, :text
  end
end
