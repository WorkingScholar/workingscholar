class Account < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :student
  has_many :resume_entries, through: :student

  belongs_to :employer
end
