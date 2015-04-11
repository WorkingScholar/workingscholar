class Account < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :student
  delegate :username, to: :student, prefix: true
end
