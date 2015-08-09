class User < ActiveRecord::Base
  validates :uid, presence: true

  def self.find_or_create_from_oauth(auth_info)
    if user = find_by(uid: auth_info.uid)
      user
    else
      create({ nickname:       auth_info.info.nickname,
               uid:            auth_info.uid,
               token:          auth_info.credentials.token
        })
    end
  end

  def rspotify_user(auth_info)
    RSpotify::User.new(auth_info)
  end
end
