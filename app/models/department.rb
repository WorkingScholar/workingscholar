class Department < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }

  default_scope do
    order("name ASC")
  end

  has_many :students
end
