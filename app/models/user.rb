class User < ApplicationRecord
  has_many :users_tasks
  has_many :users_houses
  has_many :tasks, through: :users_tasks
  has_many :houses, through: :users_houses
end
