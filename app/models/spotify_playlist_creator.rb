class SpotifyPlaylistCreator
  attr_reader :user,
              :playlist_name,
              :likes

  def initialize(user, params, likes)
    @user           = user
    @playlist_name  = params[:playlist_name]
    @likes          = likes
  end

  def begin_playlist
    user.create_playlist!(playlist_name)
  end

  def add_songs_to_playlist(playlist)
    likes.each do |like|
      track = find_track(like)
      playlist.add_tracks!([track]) if track
    end
  end

  def find_track(song)
    RSpotify::Track.search(song["track"]).find do |track|
      track.artists.find do |track_artist|
        track_artist.name == song["artist"]
      end
    end
  end

  def create_playlist
    add_songs_to_playlist(begin_playlist)
  end
end
