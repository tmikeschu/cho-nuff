require "rails_helper"

RSpec.feature "UserCreatesTaskSpec", type: :feature do
  let(:house) { create(:house, :with_kitchen) }
  let(:kitchen) { house.rooms.find_by(name: "Kitchen") }

  scenario "good form data adds a record to the database" do
    visit house_path(house)

    expect {
      click_link "Add Task"

      select("Kitchen", from: :task_room_id)
      select(:wipe, from: :task_task_type)
      select(:kitchen, from: :task_rag)
      fill_in :task_name, with: "breakfast bar counter"
      fill_in :task_description, with: "wipe down with kitchen rag"

      click_button "Submit"
    }.to change(Task, :count).by(1)

    visit house_room_path(house, kitchen)

    expect(page).to have_content "breakfast bar counter"
  end

  scenario "task room is required" do
    visit house_path(house)

    expect {
      click_link "Add Task"

      # no kitchen selection
      select(:wipe, from: :task_task_type)
      select(:kitchen, from: :task_rag)
      fill_in :task_name, with: "breakfast bar counter"
      fill_in :task_description, with: "wipe down breakfast bar counter with kitchen rag"

      click_button "Submit"
    }.to change(Task, :count).by(0)
  end
end
