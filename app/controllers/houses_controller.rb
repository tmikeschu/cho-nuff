class HousesController < ApplicationController
  def show
    @house = House.find(params.fetch(:id))
  end
end
