class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_one_attached :banner, dependent: :destroy
  has_one_attached :thumbnail, dependent: :destroy
  has_rich_text :content

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5 }

end
