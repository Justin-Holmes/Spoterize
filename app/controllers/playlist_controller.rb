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
    Resque.enqueue(CreateSpotifyPlaylistJob, current_user.id, params[:playlist_name], session[:oauth])
    redirect_to playlist_completed_path
  end

  def completed
  end
end
