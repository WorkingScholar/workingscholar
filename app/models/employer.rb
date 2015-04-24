class Employer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  has_one :account
  delegate :username, to: :account
  delegate :email, to: :account
  delegate :name, to: :account
end
