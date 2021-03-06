class User < ApplicationRecord
	has_many :workouts, dependent: :destroy
	accepts_nested_attributes_for :workouts
	has_secure_password
	
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }

	
	validates :password, presence: true, length: { minimum: 6 }
end
