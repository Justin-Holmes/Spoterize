class PlaylistController < ApplicationController
  def new
    user = Pandata::Scraper.get(params[:email])
    @likes = user.likes(:tracks)
  end

  def create
    redirect_to root_path
  end
end
