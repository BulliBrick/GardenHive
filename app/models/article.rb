class Article < ApplicationRecord
  after_create :create_approval_request

  belongs_to :user
  belongs_to :theme
  has_many :comments, dependent: :destroy
  has_one :article_approval, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :theme_id, presence: true

  private

  def create_approval_request
    ArticleApproval.create(article: self, status: 'pending')
  end

end