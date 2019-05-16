FactoryBot.define do
  factory :task do
    room
    task_type { Task.task_types.keys.sample }
    rag { Task.rags.keys.sample }
    description { "Well played" }
  end
end
