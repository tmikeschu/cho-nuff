FactoryBot.define do
  factory :task do
    room
    type { Task.types.keys.sample }
    rag { Task.rags.keys.sample }
    description { "Well played" }
  end
end
