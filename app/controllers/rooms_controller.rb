class RoomsController < ApplicationController
  def show
    @presenter = RoomPresenter.new(room: Room.find_by(id: params.fetch(:id)))
  end
end
