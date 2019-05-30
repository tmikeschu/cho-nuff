class House < ApplicationRecord
  has_many :rooms
  has_many :tasks, through: :rooms
  has_many :users_tasks, through: :tasks
  has_many :users_houses
  has_many :users, through: :users_houses

  def active_tasks(week = Date.today.at_beginning_of_week)
    users_tasks.where(week_of: week)
  end
end
