class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :track, index: true, foreign_key: true
      t.boolean :finished
      t.datetime :finished_at
      t.timestamps null: false
    end
  end
end
