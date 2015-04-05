require "gravatar"

class Student < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  belongs_to :school, counter_cache: true
  delegate :school_name, to: :school, allow_nil: true

  belongs_to :major, counter_cache: true
  delegate :major_name, to: :major, allow_nil: true

  def gravatar_image
    Gravatar.new(email).image_url(s: 100)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
