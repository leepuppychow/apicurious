class GithubInfo
  attr_reader :username,
              :uid,
              :followers,
              :following,
              :public_repos,
              :starred_repos,
              :picture

  def initialize(attributes = {})
    @username = attributes["login"]
    @uid = attributes["id"]
    @followers = attributes["followers"]
    @following = attributes["following"]
    @public_repos = attributes["public_repos"]
    @picture = attributes["avatar_url"]
    @starred_repos = starred_repos
  end

  def starred_repos
    @starred_repos ||= JSON.parse(Faraday.get("https://api.github.com/users/#{@username}/starred").body)
  end
end
