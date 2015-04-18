class Employer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  validates :name, presence: true

  has_one :account
  delegate :username, to: :account
  delegate :email, to: :account
end
