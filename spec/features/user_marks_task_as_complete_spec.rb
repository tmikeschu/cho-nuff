require "rails_helper"

RSpec.feature "UserMarksTaskAsComplete", type: :feature do
  let!(:users) { create_list(:user, 2, houses: [house]) }
  let(:house) { create(:house, :with_rooms_and_tasks, passphrase: "WOOMIES") }

  scenario "A task can be marked as complete", js: true do
    visit root_path
    fill_in :house_passphrase, with: "WOOMIES"
    click_button "cho me the money"
    house.active_tasks.each do |task|
      within ".Task--#{task.id}" do
        expect(page).to have_content "Completed: false"
        click_on "Mark Complete"
        expect(page).to have_content "Completed: true"
      end
    end
    expect(house.active_tasks.all?(&:completed?)).to be true
  end

  scenario "A task can be marked as incomplete", js: true do
    house.assign_tasks!
    house.active_tasks.each do |task|
      task.update!(completed: true)
    end

    visit root_path
    fill_in :house_passphrase, with: "WOOMIES"
    click_button "cho me the money"

    house.active_tasks.each do |task|
      within ".Task--#{task.id}" do
        expect(page).to have_content "Completed: true"
        click_on "Mark Incomplete"
        expect(page).to have_content "Completed: false"
      end
    end
    expect(house.active_tasks.all?(&:completed?)).to be false
  end
end
