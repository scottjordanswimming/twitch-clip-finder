class Streamer < ApplicationRecord

    has_many :streamer_users
has_many :clip_streamers
has_many :clips, through: :clip_streamers
  has_many :users, through: :streamer_users

   validates :name, presence: true, uniqueness: true

   scope :alpha, -> {order(:name)}
end
