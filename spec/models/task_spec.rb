require "rails_helper"

RSpec.describe Task, type: :model do
  it { should belong_to(:room) }
  it { should have_many(:users).through(:users_tasks) }
end
