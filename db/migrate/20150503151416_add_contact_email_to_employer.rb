class AddContactEmailToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :contact_email, :string
  end
end
