class User < ActiveRecord::Base
  validates :uid, presence: true

  def self.find_or_create_from_oauth(auth_info)
    if user = find_by(uid: auth_info.uid)
      user
    else
      create({ nickname:       auth_info.info.nickname,
               uid:            auth_info.uid,
               token:          auth_info.credentials.token
        })
    end
  end

  def create_spotify_playlist(params, session)
    spotify_user = rspotify_user(session[:oauth])
    SpotifyPlaylistCreator.new(spotify_user, params, likes).create_playlist
  end

  def rspotify_user(auth_info)
    RSpotify::User.new(auth_info)
  end

  def get_pandora_songs(params)
    pandora_user  = Pandata::Scraper.get(params[:email])
    Rails.cache.write("user:#{id}:working_playlist", pandora_user.likes(:tracks).to_json)
  end

  def likes
    JSON.parse(Rails.cache.read("user:#{id}:working_playlist"))
  end
end
