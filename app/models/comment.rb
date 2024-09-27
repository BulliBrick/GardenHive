class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :comment_content, presence: true
  validates :user_id, presence: true
end