FactoryBot.define do
  factory :room do
    house
    name { %w[yoga master kitchen bathroom].sample }
  end
end
