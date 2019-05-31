class HousePresenter
  attr_reader :house

  delegate :id, :name, to: :house, prefix: true

  def initialize(house:)
    @house = house
  end

  def active_tasks
    house.active_tasks.map { |task| UsersTaskPresenter.new(task: task) }
  end
end
