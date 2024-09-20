class User < ApplicationRecord
  has_many :articles
  has_many :comments
  belongs_to :user_role

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
  
  # Add any authentication logic here (e.g., has_secure_password if using bcrypt)
end