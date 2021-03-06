class User < ApplicationRecord
  has_many :reviews
    has_many :reviews_clips, through: :reviews, source: :clip
  has_many :clips

  has_many :streamer_users
    has_many :streamers, through: :streamer_users

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  def favorite_streamers
    streamers + favorite_streamers
  end

  def self.create_by_github_omniauth(auth)
     self.find_or_create_by(username: auth[:info][:email]) do |u|
       u.email = auth[:info][:email]
       u.password = SecureRandom.hex
      end
  end
  
end
