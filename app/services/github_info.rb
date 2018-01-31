class GithubInfo
  attr_reader :username,
              :uid,
              :followers,
              :following,
              :public_repos,
              :starred_repos,
              :picture

  def initialize(token)
    attributes = get_data(token)
    @username = attributes[:login]
    @uid = attributes[:id]
    @followers = attributes[:followers]
    @following = attributes[:following]
    @public_repos = attributes[:public_repos]
    @picture = attributes[:avatar_url]
    @starred_repos = GithubService.new(token).starred_repos(@username)
  end

  def get_data(token)
    GithubService.new(token).github_info
  end
end
