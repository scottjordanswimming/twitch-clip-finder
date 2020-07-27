class StreamerUser < ApplicationRecord

belongs_to :streamer
belongs_to :user
belongs_to :favorite_streamer, class_name: 'Streamer', foreign_key: :streamer_id
end
