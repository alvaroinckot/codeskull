class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :task, index: true, foreign_key: true
      t.references :grade, index: true, foreign_key: true
      t.boolean :completed
      t.timestamps null: false
    end
  end
end
