# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_one_attached :banner, dependent: :destroy
  has_one_attached :thumbnail, dependent: :destroy
  has_rich_text :content

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5 }

  def thumbnail_resize
    thumbnail.variant(resize_to_limit: [300, 300]).processed
  end

  def banner_resize
    banner.variant(resize_to_limit: [800, 700]).processed
  end
end
