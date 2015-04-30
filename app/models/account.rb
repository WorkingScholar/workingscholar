class Account < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[a-zA-Z0-9_]+\z/,
                                 message: "only allows alphanumeric and _." }
  validates :name, presence: true

  belongs_to :student
  has_many :resume_entries, through: :student

  belongs_to :employer

  def avatar_url
    Gravatar.new(email).image_url(s: 100)
  end
end
