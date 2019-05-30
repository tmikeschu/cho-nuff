require "rails_helper"

RSpec.describe House, type: :model do
  it { should have_many(:rooms) }
  it { should have_many(:users).through(:users_houses) }
  it { should have_many(:tasks).through(:rooms) }
  it { should have_many(:users_tasks).through(:tasks) }

  describe "#active_tasks" do
    let(:house) { create(:house, :with_rooms_and_tasks, passphrase: "WOOMIES") }
    let(:last_week) { Date.today.at_beginning_of_week - 1.week }
    let!(:new_tasks) { house.tasks.map { |task| create(:users_task, task: task) } }
    let!(:old_tasks) {
      house.tasks.map { |task| create(:users_task, task: task, week_of: last_week) }
    }

    it "returns the users_tasks for the current week by default" do
      expect(house.active_tasks).to match_array new_tasks
      expect(house.active_tasks.count).to_not eq house.users_tasks.count
    end

    it "returns the users_tasks for a specified week" do
      expect(house.active_tasks(last_week).count).to_not eq house.users_tasks.count
      expect(house.active_tasks(last_week)).to match_array old_tasks
    end
  end
end
