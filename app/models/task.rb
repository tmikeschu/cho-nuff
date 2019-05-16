class Task < ApplicationRecord
  belongs_to :room
  has_many :users_tasks
  has_many :users, through: :users_tasks
end
