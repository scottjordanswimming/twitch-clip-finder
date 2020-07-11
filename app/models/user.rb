class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_clips, through: :reviews, source: :clip
  has_many :clips

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  
end
