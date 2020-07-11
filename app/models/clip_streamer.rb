class ClipStreamer < ApplicationRecord
  has_many :streamers, :through => :clip_streamers
  belongs_to :clip
  belongs_to :streamer
end
