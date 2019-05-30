class HousesController < ApplicationController
  def show
    @house = House.find(params.fetch(:id))
    @house.assign_tasks!
  end
end
