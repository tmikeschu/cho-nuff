require "rails_helper"

RSpec.feature "UserViewsHouseFromHomepage", type: :feature do
  let!(:house) { create(:house, :with_rooms_and_tasks, passphrase: "WOOMIES") }
  let(:user) { create(:user, houses: [house]) }

  scenario "they can view a house using their code" do
    visit root_path
    fill_in :house_passphrase, with: "WOOMIES"
    click_button "cho me the money"

    expect(current_path).to eq house_path(house)
  end
end
