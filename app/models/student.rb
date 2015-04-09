class Student < ActiveRecord::Base
  validates :username, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one :account

  belongs_to :school, counter_cache: true

  belongs_to :major, counter_cache: true
end
