class HouseSessionsController < ApplicationController
  def create
    house = House.find_by(passphrase: params.dig(:house, :passphrase))

    if house
      redirect_to house_path(house)
    else
      flash[:danger] = "Unsuccessful login attempt"
      redirect_to root_path
    end
  end
end
