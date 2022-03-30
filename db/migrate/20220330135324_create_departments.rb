class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :indentifier
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
