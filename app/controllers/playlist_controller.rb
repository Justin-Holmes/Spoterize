class PlaylistController < ApplicationController
  def new
    if current_user.pandora_user(params).class == Pandata::Scraper
      current_user.get_pandora_songs(params)
      @likes = current_user.likes
    else
      flash[:danger] = "Please enter a valid Pandora email or make sure the profile is set to public"
      redirect_to pandora_path
    end
  end

  def create
    current_user.create_spotify_playlist(params, session)
    redirect_to root_path
  end
end
