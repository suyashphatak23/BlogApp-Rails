class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  has_one_attached :thumb, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates_uniqueness_of :name
end
