class User < ActiveRecord::Base
  # downcases email address to avoid duplicates
  before_save { self.email = email.downcase }
  # name validations
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  # email validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # contact validations
  validates :phone, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :state, presence: true
  # personal info validations
  validates :career, presence: true
  validates :experience, presence: true
  validates :years_at_job, presence: true
  validates :bio, presence: true
  # password validations
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
