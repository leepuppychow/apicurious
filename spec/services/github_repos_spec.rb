require 'rails_helper'

describe GithubRepos do
  let(:github_repos) {GithubRepos.new(ENV["MY_TOKEN"])}

  it "exists" do
    expect(github_repos).to be_a GithubRepos
    expect(github_repos.repos).to be_a Array
    expect(github_repos.repos.count).to be 22
    expect(github_repos.repos.first).to be_a Repo
    expect(github_repos.repos.first.name).to be_a String
    expect(github_repos.repos.first.id).to be_a Integer

  end

end
