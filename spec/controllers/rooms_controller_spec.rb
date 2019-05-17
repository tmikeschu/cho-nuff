require "rails_helper"

RSpec.describe RoomsController, type: :controller do
  let(:house) { create(:house, :with_kitchen) }
  let(:room) { house.rooms.first }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {house_id: house.id, id: room.id}
      expect(response).to have_http_status(:success)
    end
  end
end
