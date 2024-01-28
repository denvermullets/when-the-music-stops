class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }
end
