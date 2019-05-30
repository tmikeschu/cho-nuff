require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:houses).through(:users_houses) }
  it { should have_many(:tasks).through(:users_tasks) }

  describe "#active_tasks" do
    let(:user) { create(:user) }
    let(:tasks) { create_list(:task, 3) }
    let(:this_week) { Date.today.at_beginning_of_week }
    let(:last_week) { this_week - 1.week }
    let!(:new_tasks) {
      tasks.map { |task|
        create(:users_task, user: user, task: task, week_of: this_week)
      }
    }
    let!(:old_tasks) {
      tasks.map { |task|
        create(:users_task, user: user, task: task, week_of: last_week)
      }
    }

    it "returns the active tasks for the current week by default" do
      active_tasks = user.active_tasks
      expect(active_tasks).to match_array new_tasks
      expect(active_tasks).to_not match_array user.users_tasks
    end

    it "returns the active tasks for a specified week" do
      active_tasks = user.active_tasks(last_week)
      expect(active_tasks).to match_array old_tasks
      expect(active_tasks).to_not match_array user.users_tasks
    end
  end
end
