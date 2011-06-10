class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.integer :credits, :default => 0 

      t.timestamps
    end
  end
  
  def self.down
    drop_table :subjects
  end
end
