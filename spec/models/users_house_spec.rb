require 'rails_helper'

RSpec.describe UsersHouse, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:house) }
end
