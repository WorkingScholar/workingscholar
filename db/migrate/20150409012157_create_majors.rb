class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :name
      t.integer :students_count, default: 0

      t.timestamps null: false
    end
  end
end
