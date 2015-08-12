class User < ActiveRecord::Base
  validates :uid, presence: true

  def self.find_or_create_from_oauth(auth_info)
    if user = find_by(uid: auth_info.uid)
      user
    else
      create({  uid:            auth_info.uid,
                token:          auth_info.credentials.token
        })
    end
  end

  def create_spotify_playlist(params, session)
    SpotifyPlaylistCreator.new(rspotify_user(session[:oauth]), params, likes).create_playlist
  end

  def rspotify_user(auth_info)
    RSpotify::User.new(auth_info)
  end

  def pandora_user(params)
    Pandata::Scraper.get(params[:email])
  end

  def likes_for_pandora_user(params)
    pandora_user(params).likes(:tracks)
  end

  def get_pandora_songs(params)
    Rails.cache.write("user:#{id}:working_playlist", likes_for_pandora_user(params).to_json)
  end

  def likes
    JSON.parse(Rails.cache.read("user:#{id}:working_playlist"))
  end
end
