class MoveUsernameToAccount < ActiveRecord::Migration
  def up
    add_column :accounts, :username, :string

    Account.reset_column_information

    Student.all.each do |student|
      account = Account.where(student: student.id).first
      account.update_attributes username: student.username
    end

    Employer.all.each do |employer|
      account = Account.where(employer: employer.id).first
      account.update_attributes username: employer.username
    end

    remove_column :students, :username
    remove_column :employers, :username
  end

  def down
    add_column :students, :username, :string
    add_column :employers, :username, :string

    Student.reset_column_information
    Employer.reset_column_information

    Account.all.each do |account|
      if account.student
        resource = Student.find account.student
        resource.update_attributes username: account.username
      elsif account.employer
        resource = Employer.find account.employer
        resource.update_attributes username: account.username
      else
        # Do nothing
      end
    end

    remove_column :accounts, :username
  end
end
