FactoryBot.define do
  factory :users_task do
    task
    user
    completed { false }
    week_of { Date.now.at_beginning_of_week }
  end
end
