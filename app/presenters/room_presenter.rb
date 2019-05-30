class RoomPresenter
  DETAILS = {
    name: "Name",
    description: "Description",
    task_type: "Type",
    rag: "Rag",
  }

  delegate :name, to: :room, prefix: true

  attr_reader :room
  def initialize(room:)
    @room = room
  end

  def room_name
    room.name
  end

  def room_tasks_details
    room.tasks.map { |task|
      DETAILS.map { |message, label| {label: label, value: task.send(message)} }
    }
  end
end
