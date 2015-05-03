require "gravatar-ultimate"

class Student < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  has_one :account
  delegate :username, to: :account
  delegate :email, to: :account
  delegate :name, to: :account

  belongs_to :school, counter_cache: true
  delegate :name, to: :school, prefix: true, allow_nil: true

  belongs_to :department, counter_cache: true
  delegate :id, to: :department, prefix: true, allow_nil: true
  delegate :name, to: :department, prefix: true, allow_nil: true

  belongs_to :major, counter_cache: true
  delegate :name, to: :major, prefix: true, allow_nil: true

  has_many :resume_entries, -> { order "abs(partial_end_date) DESC" }
  has_many :posting_applications
end
