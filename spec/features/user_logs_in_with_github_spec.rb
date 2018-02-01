require 'rails_helper'

describe "When a user visits the root path" do
  it "can click on Login to login with GitHub credentials" do
    VCR.use_cassette("all_info") do
      stub_omniauth
      visit "/"
      click_on "Login"

      expect(page.status_code).to eq 200
      expect(current_path).to eq dashboard_index_path
      expect(page).to have_content "lee"
      expect(page).to have_link "Logout"
    end
  end
end
