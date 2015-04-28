class AddViewCountToPosting < ActiveRecord::Migration
  def change
    add_column :postings, :view_count, :integer, default: 0
  end
end
