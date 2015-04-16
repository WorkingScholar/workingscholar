class CreateResumeEntries < ActiveRecord::Migration
  def change
    create_table :resume_entries do |t|
      t.references :student, index: true, foreign_key: true
      t.string :job_title
      t.string :employer_name
      t.references :employer, index: true, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.text :description

      t.timestamps null: false
    end
  end
end
