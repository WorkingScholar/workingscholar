class Major < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }

  has_many :students

  def major_name
    name
  end
end
