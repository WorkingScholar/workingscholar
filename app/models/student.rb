require "gravatar"

class Student < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  belongs_to :school, counter_cache: true

  belongs_to :major, counter_cache: true

  def gravatar_image
    Gravatar.new(email).image_url(s: 100)
  end
end
