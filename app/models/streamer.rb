class Streamer < ApplicationRecord
has_many :clip_streamers
  has_many :clips, through: :clip_streamers

   validates :name, presence: true, uniqueness: true

   scope :alpha, -> {order(:name)}
end
