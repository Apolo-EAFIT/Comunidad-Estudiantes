class CreateSubjectsTeachers < ActiveRecord::Migration
  def change
    create_table :subjects_teachers, :id => false do |t|
      t.integer :subject_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
