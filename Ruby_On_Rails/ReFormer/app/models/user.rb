class User < ApplicationRecord
  has_secure_password :password
  before_save { self.email = email.downcase }
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]*\z/
  validates :username, presence: true, length: { maximum: 20 }, format:
  { with: VALID_USERNAME_REGEX }, uniqueness: true

  VALID_PASSWORD_REGEX =/[!@$%&*]/
  validates :password, length: { minimum: 8 },
                              format: { with: VALID_PASSWORD_REGEX}

  VALID_EMAIL_REGEX = /\A[A-Z][A-Z0-9._%+-]*@[A-Z][A-Z0-9.-]+\.[A-Z]{2,}\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
