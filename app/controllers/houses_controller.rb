class HousesController < ApplicationController
  def show
    house = House.find(params.fetch(:id))
    house.assign_tasks!
    @presenter = HousePresenter.new(house: house)
  end
end
