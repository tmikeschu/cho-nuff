require "rails_helper"

RSpec.describe TasksController, type: :controller do
  let(:house) { create(:house, :with_kitchen) }
  let(:room) { house.rooms.first }

  describe "POST #create" do
    it "returns http success" do
      params = {
        house_id: house.id,
        task: {
          room_id: room.id,
          task_type: "wipe",
          rag: "kitchen",
          description: "hello",
        },
      }
      post :create, params: params
      expect(response).to redirect_to(house_room_path(house, room))
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: {house_id: house.id}
      expect(response).to have_http_status(:success)
    end
  end
end
