class DashboardController < ApplicationController

  def index
    @github_info = GithubInfo.new(current_user.token)
    @github_repos = GithubRepos.new(current_user.token)

    # @github_repos = GithubRepos.new(JSON.parse(user_repos))
  end

  private

    def user_repos
      Faraday.get("https://api.github.com/user/repos?access_token=#{current_user.token}").body
    end
end
