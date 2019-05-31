class House < ApplicationRecord
  has_many :rooms
  has_many :tasks, through: :rooms
  has_many :users_tasks, through: :tasks
  has_many :users_houses
  has_many :users, through: :users_houses

  def active_tasks(week = this_week)
    users_tasks.where(week_of: week)
  end

  def assign_tasks!
    if users.present? && active_tasks.empty?
      user_ids, task_ids = [users, tasks].map { |assoc| assoc.pluck(:id) }

      task_ids.shuffle.reduce(user_ids) do |user_ids, task_id|
        UsersTask.create(
          task_id: task_id,
          user_id: user_ids.fetch(0),
          week_of: this_week,
        )

        user_ids.rotate
      end
    end
  end

  private

  def this_week
    @_this_week ||= Date.today.at_beginning_of_week
  end
end
