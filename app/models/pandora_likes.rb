class PandoraLikes
  def self.set_pandora_user(params)
    pandora_user  = Pandata::Scraper.get(params[:email])
    @likes        = pandora_user.likes(:tracks)
  end

  def self.likes
    @likes
  end
end
