class Streamer < ApplicationRecord
  has_many :clips

   validates :name, presence: true, uniqueness: true

   scope :alpha, -> {order(:name)}
end
