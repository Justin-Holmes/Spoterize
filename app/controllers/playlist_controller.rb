class PlaylistController < ApplicationController
  def new
    current_user.set_pandora_user(params)
    @likes = current_user.likes
  end

  def create
    current_user.create_spotify_playlist(params, session)
    redirect_to root_path
  end
end
