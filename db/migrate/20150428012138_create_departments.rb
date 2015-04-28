class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :student_count, default: 0

      t.timestamps null: false
    end
  end
end
