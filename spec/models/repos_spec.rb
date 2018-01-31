require 'rails_helper'

describe Repo do
  it "has the following attributes" do
    attributes = {id: 5,
                  name: "lee",
                  language: "Ruby",
                  stargazers_count: 5,
                  updated_at: Date.today}
    repo = Repo.new(attributes)

    expect(repo.id).to eq 5
    expect(repo.name).to eq "lee"
    expect(repo.language).to eq "Ruby"
    expect(repo.star_count).to eq 5
    expect(repo.updated_at).to eq Date.today
  end
end
