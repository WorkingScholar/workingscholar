require "gravatar-ultimate"

class Student < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one :account
  delegate :username, to: :account
  delegate :email, to: :account

  belongs_to :school, counter_cache: true
  delegate :name, to: :school, prefix: true, allow_nil: true

  belongs_to :major, counter_cache: true
  delegate :name, to: :major, prefix: true, allow_nil: true

  has_many :resume_entries, -> { order "end_date DESC" }

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    Gravatar.new(email).image_url(s: 100)
  end
end
