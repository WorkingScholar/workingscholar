class Student < ActiveRecord::Base
  validates :username, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one :account
  delegate :email, to: :account, prefix: true

  belongs_to :school, counter_cache: true
  delegate :name, to: :school, prefix: true, allow_nil: true

  belongs_to :major, counter_cache: true
  delegate :name, to: :major, prefix: true, allow_nil: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
