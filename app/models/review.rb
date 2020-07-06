class Review < ApplicationRecord
  belongs_to :user
  belongs_to :clip

  validates :title, presence: true
  validates :title, length: {maximum: 25}
  validates :url, length: {maximum: 250}

  validates :clip, uniqueness: { scope: :user, message: "has already been reviewed by you"  }
end
