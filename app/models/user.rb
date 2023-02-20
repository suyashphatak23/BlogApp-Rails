class User < ApplicationRecord
  # Converting to lowercase before saving the email of a user
  before_save { self.email = email.downcase }
  has_many :articles
  has_one_attached :avatar, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def avatar_small
    avatar.variant(resize_to_fill: [38, 38]).processed
  end

  def avatar_article
    avatar.variant(resize_to_fill: [60, 60]).processed
  end

  def avatar_medium
    avatar.variant(resize_to_fill: [300, 300]).processed
  end
end
