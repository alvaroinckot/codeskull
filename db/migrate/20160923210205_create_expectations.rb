class CreateExpectations < ActiveRecord::Migration
  def change
    create_table :expectations do |t|
      t.string :name
      t.string :var_type
      t.string :value
      t.references :task, index: true, foreign_key: true
      t.string :operator

      t.timestamps null: false
    end
  end
end
