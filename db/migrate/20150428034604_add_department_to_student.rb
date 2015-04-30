class AddDepartmentToStudent < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.references :department, index: true, foreign_key: true
    end
  end
end
