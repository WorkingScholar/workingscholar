class Account < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :student
  delegate :username, to: :student, prefix: true
  has_many :resume_entries, through: :student

  belongs_to :employer
end
