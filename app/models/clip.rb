class Clip < ApplicationRecord
  has_many :reviews
  validates :title, presence: true,
                    length: {minimum: 3}
end
