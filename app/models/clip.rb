class Clip < ApplicationRecord
  #belongs_to :user
  has_many :clip_streamers
  has_many :streamers, {:through=>:clip_streamers, :source=>"streamer"}
  has_many :reviews
  has_many :users
  #accepts_nested_attributes_for :streamers

  validates :title, presence: true,
                    length: {minimum: 3}

  scope :alpha, -> {order(:title)}

  def streamers_attributes=(streamers_hashes)
    streamers_hashes.each do |i, streamer_attributes|
    streamer = Streamer.find_or_create_by(name: streamer_attributes[:name])
    self.clip_streamers.build(:streamer => streamer)
    end
  end

end
