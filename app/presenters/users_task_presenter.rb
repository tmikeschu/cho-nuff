class UsersTaskPresenter
  DETAILS = {
    name: "Task",
    description: "Instructions",
    user_name: "Roomie",
    completed: "Completed",
  }

  delegate :id, :completed?, to: :task

  attr_reader :task

  def initialize(task:)
    @task = task
  end

  def completed_label
    if task.completed?
      "Not Done"
    else
      "Done"
    end
  end

  def details
    DETAILS.map { |message, label|
      {
        label: label,
        value: task.send(message),
        target: "info_#{message}".camelize(:lower),
      }
    }
  end
end
