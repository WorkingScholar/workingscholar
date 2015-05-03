class AddMatchedToPostingApplication < ActiveRecord::Migration
  def change
    add_column :posting_applications, :matched, :boolean
  end
end
