require "rails_helper"

RSpec.feature "UserSeesTasksForWeeks", type: :feature do
  let!(:users) { create_list(:user, 2, houses: [house]) }
  let(:house) { create(:house, :with_rooms_and_tasks, passphrase: "WOOMIES") }

  scenario "Viewing the dashboard shows everyone's tasks for the week" do
    visit root_path
    fill_in :house_passphrase, with: "WOOMIES"
    click_button "cho me the money"

    expect(house.active_tasks.empty?).to be false
    house.active_tasks.each do |task|
      expect(task.user).to be_in users

      within ".Task--#{task.id}" do
        expect(page).to have_content task.user.name
      end
    end
  end
end
