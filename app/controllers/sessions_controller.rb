class SessionsController < ApplicationController

  def create
    token = Procore::Auth::Token.new(
      access_token: auth_hash["token"],
      refresh_token: auth_hash["refresh_token"],
      expires_at: auth_hash["expires_at"])

    store = Procore::Auth::Stores::File.new(
      path: "./#{auth_hash["provider"]}_tokens.yml",
      key: auth_hash["uid"])

     store.save(token)

     redirect_to companies_url
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
