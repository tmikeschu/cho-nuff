require "rails_helper"

RSpec.describe Task, type: :model do
  describe "validations" do
    it { should belong_to(:room) }
    it { should have_many(:users).through(:users_tasks) }
    it {
      should define_enum_for(:type)
        .with_values(%i[mop organize sweep trash vacuum wipe])
    }
    it {
      should define_enum_for(:rag)
        .with_values(%i[dust kitchen polish porcelain range stainless window])
    }
  end
end
