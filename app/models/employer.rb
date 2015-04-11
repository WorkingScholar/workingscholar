class Employer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  validates :name, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  has_one :account
end
