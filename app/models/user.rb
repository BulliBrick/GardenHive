class User < ApplicationRecord
  enum user_role: {user: 'user', moderator: 'moderator', admin: 'admin'}

  has_many :articles
  has_many :comments
  has_many :article_approvals, foreign_key: 'approved_by_id'

  validates :username, presence: true, uniqueness: true

  has_secure_password

  # Add any authentication logic here (e.g., has_secure_password if using bcrypt)
end