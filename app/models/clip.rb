class Clip < ApplicationRecord

  belongs_to :user
  has_one :streamer
  has_many :reviews
  has_many :users, through: :reviews

  has_many :reviews

  validates :title, presence: true,
                    length: {minimum: 3}

#  validate :not_a_duplicate
end
