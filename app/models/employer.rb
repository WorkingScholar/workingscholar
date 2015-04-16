class Employer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  has_one :account
end
