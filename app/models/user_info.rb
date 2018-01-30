class UserInfo
  attr_reader :username,
              :uid,
              :followers,
              :following,
              :public_repos,
              :picture

  def initialize(attributes = {})
    @username = attributes["login"]
    @uid = attributes["id"]
    @followers = attributes["followers"]
    @following = attributes["following"]
    @public_repos = attributes["public_repos"]
    @picture = attributes["avatar_url"]
  end

  def starred_repos
    JSON.parse(Faraday.get("https://api.github.com/users/#{@username}/starred").body)
  end
end
