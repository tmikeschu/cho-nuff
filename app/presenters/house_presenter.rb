class HousePresenter
  DETAILS = {
    name: "Task",
    description: "Instructions",
    user_name: "Roomie",
    completed: "Completed",
  }

  attr_reader :house

  delegate :id, :name, to: :house, prefix: true

  def initialize(house:)
    @house = house
  end

  def active_tasks
    house.active_tasks.map { |task|
      {
        id: task.id,
        details: DETAILS.map { |message, label|
          {
            label: label,
            value: task.send(message),
          }
        },
      }
    }
  end
end
