class MoveNameToAccount < ActiveRecord::Migration
  def up
    add_column :accounts, :name, :string

    Account.reset_column_information

    Student.all.each do |student|
      account = Account.where(student: student.id).first
      account.update_attributes name: "#{student.first_name} #{student.last_name}"
    end

    Employer.all.each do |employer|
      account = Account.where(employer: employer.id).first
      account.update_attributes name: employer.name
    end

    remove_column :students, :first_name
    remove_column :students, :last_name
    remove_column :employers, :name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :employers, :name, :string

    Student.reset_column_information
    Employer.reset_column_information

    Account.all.each do |account|
      if account.student
        name = account.name.split(" ", 2)
        resource = Student.find account.student
        resource.update_attributes first_name: name[0], last_name: name[1]
      elsif account.employer
        resource = Employer.find account.employer
        resource.update_attributes name: account.name
      else
        # Do nothing
      end
    end

    remove_column :accounts, :name
  end
end
