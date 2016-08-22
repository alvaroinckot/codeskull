class AddCategoryToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :category, :integer
  end
end
