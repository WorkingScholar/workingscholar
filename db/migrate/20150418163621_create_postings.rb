class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.string :description
      t.references :employer, index: true, foreign_key: true
      t.integer :duration
      t.string :compensation

      t.timestamps null: false
    end
  end
end
