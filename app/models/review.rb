class Review < ApplicationRecord
  belongs_to :clip
  has_one :user

  validates :url, length: {maximum: 250}
  validates :clip, uniqueness: { scope: :user, message: "has already been reviewed by you"  }

  scope :alpha, -> {order(:title)}

end
