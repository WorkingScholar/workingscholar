class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.date :graduation_year
      t.references :school, index: true, foreign_key: true
      t.references :major, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
