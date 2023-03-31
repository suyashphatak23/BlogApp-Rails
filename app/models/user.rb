class User < ApplicationRecord
  # Converting to lowercase before saving the email of a user
  before_save { self.email = email.downcase }
  has_many :articles
  has_one_attached :avatar, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates :social_facebook, length: {maximum: 30}
  validates :social_linkedin, presence: true, length: {maximum: 30}
  validates :social_instagram, length: {maximum: 30}

  has_secure_password

  # def avatar_article
  #   avatar.variant(resize: "60x60").processed
  # end

end
