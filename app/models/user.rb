class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :user_topic_receipts
  has_many :topics

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  def admin?
    role == 9001
  end
end
