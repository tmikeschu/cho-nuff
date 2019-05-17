require "rails_helper"

RSpec.describe HouseSessionsController, type: :controller do
  let(:house) { create(:house) }

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {house: {passphrase: house.passphrase}}
      expect(response).to redirect_to(house_path(house))
    end
  end
end
