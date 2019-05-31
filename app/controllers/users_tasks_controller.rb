class UsersTasksController < ApplicationController
  def update
    task = UsersTask.find(params.fetch(:id))
    task.update(completed: params.fetch(:completed))
  end
end
