class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :email
      t.string :name
      t.string :username

      t.timestamps null: false
    end
  end
end
