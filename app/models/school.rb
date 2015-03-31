class School < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }

  has_many :students
end
