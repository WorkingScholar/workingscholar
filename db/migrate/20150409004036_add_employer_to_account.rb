class AddEmployerToAccount < ActiveRecord::Migration
  def change
    add_reference :accounts, :employer, index: true, foreign_key: true
  end
end
