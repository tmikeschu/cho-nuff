require "rails_helper"

RSpec.feature "UserViewsHouseFromHomepage", type: :feature do
  let!(:user) { create(:user, houses: [house]) }
  let(:house) { create(:house, :with_rooms_and_tasks, passphrase: "WOOMIES") }

  scenario "they can view a house using their code" do
    visit root_path
    fill_in :house_passphrase, with: "WOOMIES"
    click_button "cho me the money"

    expect(current_path).to eq house_path(house)
  end

  scenario "an incorrect code does not work" do
    visit root_path
    fill_in :house_passphrase, with: "WOMBAT"
    click_button "cho me the money"

    expect(page).to have_content "Invalid house passphrase"
    expect(current_path).to eq root_path
  end
end
