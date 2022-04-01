class CreateCouseSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :couse_subjects do |t|
      t.references :college_subject, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
