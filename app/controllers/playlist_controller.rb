# require '../models/pandora_likes.rb'

class PlaylistController < ApplicationController
  before_action :set_pandora_user, only: [:new]

  def new
    @likes = PandoraLikes.likes
  end

  def create
    likes         = PandoraLikes.likes
    spotify_user  = current_user.rspotify_user(session[:oauth])
    playlist      = spotify_user.create_playlist!(params[:playlist_name])

    likes.each do |like|
      track = RSpotify::Track.search(like[:track]).find { |track| track.artists.find { |track_artist| track_artist.name == like[:artist] }}
      playlist.add_tracks!([track]) if track
    end

    redirect_to root_path
  end

  private

  def set_pandora_user
    PandoraLikes.set_pandora_user(params)
  end
end
