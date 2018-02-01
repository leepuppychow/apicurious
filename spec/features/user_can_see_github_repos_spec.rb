require 'rails_helper'

feature "User can login and see their repos" do
  scenario "user clicks on Login and is routed to their dashboard with existing repos" do
    VCR.use_cassette("all_info") do
      stub_omniauth
      visit "/"
      click_on "Login"
      expect(current_path).to eq dashboard_index_path
      expect(page).to have_content "Repositories"
      expect(page).to have_css(".repo", count: 22)

      within(first(".repo")) do
        expect(page).to have_css ".name"
        expect(page).to have_css ".language"
      end
    end
  end
end
