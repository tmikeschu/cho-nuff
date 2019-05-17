class TasksController < ApplicationController
  def new
    @presenter = TaskPresenter.new(
      house: House.find(params.fetch(:house_id)),
      task: Task.new,
      rags: Task.rags,
      task_types: Task.task_types
    )
  end

  def create
    task = Task.new(task_params)

    if task.save
      redirect_to house_room_path(task.house, task.room)
    else
      @presenter = TaskPresenter.new(
        house: House.find(params.fetch(:house_id)),
        task: Task.new,
        rags: Task.rags,
        task_types: Task.task_types
      )
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:room_id, :task_type, :rag, :description)
  end

  def house
    params.value
  end
end
