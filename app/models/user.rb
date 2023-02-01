class User < ApplicationRecord
    # Converting to lowercase before saving the email of a user
    before_save { self.email = email.downcase }

    # Relationship between user and article
    has_many :articles

    # For validation of Username
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    
    # Regular Expression for matching valid email field
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    # For validation of email with regex constant variable
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }

    # Parameter for BCrypt library
    has_secure_password
end