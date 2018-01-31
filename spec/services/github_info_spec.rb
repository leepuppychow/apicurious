require 'rails_helper'

describe GithubInfo do
  let(:github_info) {GithubInfo.new(ENV["MY_TOKEN"])}

  it "exists" do
    expect(github_info).to be_a GithubInfo
    expect(github_info.username).to eq "leepuppychow"
    expect(github_info.uid).to eq 29440370
    expect(github_info.followers).to eq 1
    expect(github_info.following).to eq 0
    expect(github_info.public_repos).to eq 18
    expect(github_info.picture).to be_a String
    expect(github_info.starred_repos).to be_a Array
    expect(github_info.starred_repos.count).to eq 0
  end

end
