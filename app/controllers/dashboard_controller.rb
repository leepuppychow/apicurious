class DashboardController < ApplicationController

  def index
    user_repos = Faraday.get("https://api.github.com/user/repos?access_token=#{current_user.token}").body
    @user_repos = JSON.parse(user_repos)

    user_info = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}").body
    @user_info = JSON.parse(user_info)
    @picture = @user_info["avatar_url"]
  end

end
