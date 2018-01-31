require 'rails_helper'

describe GithubService do
  let(:github_service) {GithubService.new(ENV["MY_TOKEN"])}

  it "exists" do
    expect(github_service).to be_a GithubService
  end

  context "Instance Methods" do
    context "#github_info" do
      it "can get user's GitHub information" do
        service = github_service.github_info
        expect(service).to be_a Hash
        expect(service[:login]).to be_a String
        expect(service[:id]).to be_a Integer
        expect(service[:followers]).to be_a Integer
        expect(service[:following]).to be_a Integer
        expect(service[:public_repos]).to be_a Integer
        expect(service[:avatar_url]).to be_a String
        expect(service[:starred_url]).to be_a String
      end
    end

    context "#github_repos" do
      it "can get user's GitHub repo information" do
        service = github_service.github_repos
        expect(service).to be_a Array
        expect(service.count).to eq 22
        expect(service.first[:id]).to be_a Integer
        expect(service.first[:name]).to be_a String
      end
    end

    context "#starred_repos" do
      it "can get user's Github repos that are starred" do
        service = github_service.starred_repos("leepuppychow")
        expect(service).to be_a Array
        expect(service.count).to eq 1
        expect(service.first[:id]).to be_a Integer
        expect(service.first[:name]).to be_a String
      end
    end
  end


end
