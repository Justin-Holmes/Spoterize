require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: 'playlist-modify-public playlist-modify-private playlist-read-private user-read-private user-read-email'
end
