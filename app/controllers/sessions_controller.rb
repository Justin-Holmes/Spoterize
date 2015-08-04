class SessionsController < ApplicationController
  def create
    redirect_to email_path
  end

  private

  def oauth
    request.env['omniauth.auth']
  end
end
