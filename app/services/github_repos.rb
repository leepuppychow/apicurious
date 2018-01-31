class GithubRepos

  def initialize(token)
    @raw_repos = get_data(token)
  end

  def get_data(token)
    GithubService.new(token).github_repos
  end

  def repos
    @raw_repos.map {|raw_repo| Repo.new(raw_repo)}
  end

end
