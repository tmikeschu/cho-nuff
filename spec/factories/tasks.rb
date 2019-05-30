FactoryBot.define do
  factory :task do
    room
    task_type { Task.task_types.keys.sample }
    rag { Task.rags.keys.sample }
    name { "Sweep stairs" }
    description { "you better do a good job! use a broom." }
  end
end
