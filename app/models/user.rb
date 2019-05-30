class User < ApplicationRecord
  has_many :users_tasks
  has_many :users_houses
  has_many :tasks, through: :users_tasks
  has_many :houses, through: :users_houses

  def active_tasks(week = this_week)
    users_tasks.where(week_of: week)
  end

  private

  def this_week
    @_this_week ||= Date.today.at_beginning_of_week
  end
end
