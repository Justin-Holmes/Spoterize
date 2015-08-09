class PlaylistController < ApplicationController
  def new
    user = Pandata::Scraper.get(params[:email])
    @likes = user.likes(:tracks)
  end

  def create
    spotify_user = current_user.rspotify_user(session[:oauth])
    spotify_user.create_playlist!(params[:playlist_name])

    redirect_to root_path
  end
end
