class GithubRepos
  attr_reader :repos

  def initialize(attributes)
    @raw_repos = attributes
  end

  def repos
    @raw_repos.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
