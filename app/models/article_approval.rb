class ArticleApproval < ApplicationRecord
  belongs_to :article
  belongs_to :approved_by, class_name: 'User'

  validates :status, presence: true, inclusion: { in: ['pending', 'approved', 'rejected'] }
end