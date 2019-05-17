class HouseSessionsController < ApplicationController
  def create
    house = House.find_by(passphrase: params.dig(:house, :passphrase))

    if house
      session[:house_id] = house.id
      redirect_to house_path(house)
    else
      flash[:danger] = "Invalid house passphrase"
      redirect_to root_path
    end
  end
end
