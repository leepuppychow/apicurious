class SessionController < ApplicationController

  def create
    code = params["code"]
    response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["CLIENT_ID"]}&client_secret=#{ENV["CLIENT_SECRET"]}&code=#{code}")
    token = response.body.split(/\W+/).second
    save_user(user_data(token), token)
    redirect_to dashboard_index_path
  end

  private

    def user_data(token)
      JSON.parse(Faraday.get("https://api.github.com/user?access_token=#{token}").body)
    end

    def save_user(user_data, token)
      user = User.find_or_create_by(uid: user_data["id"])
      user.username = user_data["login"]
      user.uid = user_data["id"]
      user.name = user_data["name"]
      user.token = token
      user.save

      session[:user_id] = user.id
    end

end
