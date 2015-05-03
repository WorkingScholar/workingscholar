class AddPictureUploadToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :photo_url, :string
  end
end
