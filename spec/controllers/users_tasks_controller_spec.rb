require "rails_helper"

RSpec.describe UsersTasksController, type: :controller do
  let(:task) { create(:users_task) }

  describe "PATCH #update" do
    it "marks a task as complete" do
      expect(task.completed?).to be false
      patch(
        :update,
        params: {
          house_id: task.house.id,
          id: task.id,
          users_task: {completed: true},
        },
        format: :json
      )
      expect(response).to have_http_status(:success)
      task.reload
      expect(task.completed?).to be true
    end

    it "marks a task as incomplete" do
      task.update(completed: true)
      expect(task.completed?).to be true
      patch(
        :update,
        params: {
          house_id: task.house.id,
          id: task.id,
          users_task: {completed: false},
        },
        format: :json
      )
      task.reload
      expect(response).to have_http_status(:success)
      expect(task.completed?).to be false
    end
  end
end
