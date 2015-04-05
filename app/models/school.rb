class School < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }

  has_many :students

  def school_name
    name
  end
end
