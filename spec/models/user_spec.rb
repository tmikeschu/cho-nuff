require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:houses).through(:users_houses) }
  it { should have_many(:tasks).through(:users_tasks) }
end
