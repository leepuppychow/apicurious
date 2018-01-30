class DashboardController < ApplicationController

  def index
    @user_repos = UserRepos.new(JSON.parse(user_repos))
    @user_info = UserInfo.new(JSON.parse(user_info))
  end
  
  private

    def user_repos
      Faraday.get("https://api.github.com/user/repos?access_token=#{current_user.token}").body
    end

    def user_info
      Faraday.get("https://api.github.com/user?access_token=#{current_user.token}").body
    end

end
