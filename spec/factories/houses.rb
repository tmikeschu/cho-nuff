FactoryBot.define do
  factory :house do
    name { "1064" }
    passphrase { "ONE WAY" }
  end

  trait :with_kitchen do
    after(:create) do |house|
      house.rooms << create(:room, house: house, name: "Kitchen")
      house.save!
    end
  end

  trait :with_rooms_and_tasks do
    after(:create) do |house|
      house.rooms << create_list(:room, 2, house: house)
      house.rooms.each do |room|
        room.tasks << create(:task)
        room.save!
      end
      house.save!
    end
  end
end
