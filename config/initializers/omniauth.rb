Rails.application.config.middleware.use OmniAuth::Builder do

  provider :github, :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

end
