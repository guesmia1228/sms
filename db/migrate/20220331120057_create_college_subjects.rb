class CreateCollegeSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :college_subjects do |t|
      t.string :name
      t.text :description
      t.references :department, foreign_key: true
      t.string :indentifier
      t.references :college_subject, foreign_key: true

      t.timestamps
    end
  end
end
