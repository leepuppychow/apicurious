class GithubService

  def initialize(token)
    @token = token
  end

  def github_info
    get_json("https://api.github.com/user?access_token=#{token}")
  end

  def github_repos
    get_json("https://api.github.com/user/repos?access_token=#{token}")
  end

  def starred_repos(username)
    get_json("https://api.github.com/users/#{username}/starred")
  end

  private

    attr_reader :token

    def get_json(url)
      JSON.parse(Faraday.get(url).body, symbolize_names: true)
    end

end
