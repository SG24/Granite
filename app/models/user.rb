class User < ApplicationRecord
  has_secure_password

  has_many :tasks, dependent: :destroy, foreign_key: :assignee_id

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
