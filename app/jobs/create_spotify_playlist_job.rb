class CreateSpotifyPlaylistJob
  @queue = :create_spotify_playlist

  def self.perform(user_id, params, session)
    current_user = User.find_by(id: user_id)
    current_user.create_spotify_playlist(params, session)
  end
end
