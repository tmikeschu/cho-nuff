class TaskPresenter
  attr_reader :house
  attr_accessor :task

  def initialize(house:, task:, rags:, task_types:)
    @house = house
    @task = task
    @rags = rags
    @task_types = task_types
  end

  def rooms
    house.rooms.map { |room| [room.name, room.id] }
  end

  def task_types
    @task_types.keys
  end

  def rags
    @rags.keys
  end
end
