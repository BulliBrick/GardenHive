class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments
  has_one :article_approval

  validates :title, presence: true
  validates :body, presence: true
end