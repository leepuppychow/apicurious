class DashboardController < ApplicationController

  def index
    @github_info = GithubInfo.new(current_user.token)
    @github_repos = GithubRepos.new(current_user.token)
  end
  
end
