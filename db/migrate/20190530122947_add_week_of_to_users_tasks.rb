class AddWeekOfToUsersTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :users_tasks, :week_of, :date
  end
end
