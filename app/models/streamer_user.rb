class StreamerUser < ApplicationRecord

  belongs_to :streamer
    belongs_to :user

end
