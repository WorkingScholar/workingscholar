class Employer < ActiveRecord::Base
  validates :name, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  has_one :account
end
