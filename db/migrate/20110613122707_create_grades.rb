class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :user_id
      t.integer :gradable_id
      t.string :gradable_type
      t.integer :score

      t.timestamps
    end
  end
end
