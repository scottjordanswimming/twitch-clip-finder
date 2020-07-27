Rails.application.config.middleware.use OmniAuth::Builder do

  provider :github, '31f7d228a14ddcde0fed', '44f573e030c936b038ab836e312e445a4e422065', origin_param: false

end
