class Streamer < ApplicationRecord

has_many :streamer_users
has_many :users, through: :streamer_users

accepts_nested_attributes_for :streamer_users

has_many :clip_streamers
has_many :clips, through: :clip_streamers


validates :name, presence: true, uniqueness: true

scope :alpha, -> {order(:name)}

end
