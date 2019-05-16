require "rails_helper"

RSpec.describe House, type: :model do
  it { should have_many(:rooms) }
  it { should have_many(:users).through(:users_houses) }
  it { should have_many(:tasks).through(:rooms) }
end
