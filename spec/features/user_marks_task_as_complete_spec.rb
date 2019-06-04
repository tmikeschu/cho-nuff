require "rails_helper"

RSpec.feature "UserMarksTaskAsComplete", type: :feature do
  let!(:users) { create_list(:user, 2, houses: [house]) }
  let(:house) { create(:house, :with_rooms_and_tasks, passphrase: "WOOMIES") }
  USERS_TASK_BLOCK = ".UsersTask"

  scenario "A task can be marked as complete and incomplete", js: true do
    visit root_path
    fill_in :house_passphrase, with: "WOOMIES"
    click_button "cho me the money"

    house.active_tasks.each do |task|
      expect_completed_to_be = make_expect_task_completed(task.id)

      expect_completed_to_be.call(false)

      within "#{USERS_TASK_BLOCK}--#{task.id}" do
        check("Completed:")
      end

      expect_completed_to_be.call(true)

      within "#{USERS_TASK_BLOCK}--#{task.id}" do
        uncheck("Completed:")
      end

      expect_completed_to_be.call(false)
    end
  end

  def make_expect_task_completed(id)
    ->(is_completed) do
      attr = "[data-users-task-is-completed='#{is_completed}']"
      selector = "#{USERS_TASK_BLOCK}--#{id}#{attr}"
      expect(page).to have_css(selector)
    end
  end
end
