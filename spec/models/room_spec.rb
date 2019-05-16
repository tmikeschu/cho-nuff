require "rails_helper"

RSpec.describe Room, type: :model do
  it { should belong_to(:house) }
  it { should have_many(:tasks) }
end
