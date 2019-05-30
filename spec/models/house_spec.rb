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

  describe "#assign_tasks!" do
    let!(:users) { create_list(:user, 2, houses: [house]) }
    let(:house) { create(:house, :with_rooms_and_tasks, passphrase: "WOOMIES") }

    it "assigns tasks for the current week" do
      expect(users.all? { |user| user.active_tasks.present? }).to be false

      expect { house.assign_tasks! }
        .to change { house.active_tasks.count }
        .by(house.tasks.count)
        .and change { users.all? { |user| user.active_tasks.present? } }
        .from(false)
        .to(true)
    end

    it "is idempotent in a given week" do
      house.assign_tasks!

      10.times do
        expect { house.assign_tasks! }
          .to_not(change { house.active_tasks.count })
      end
    end
  end
end
