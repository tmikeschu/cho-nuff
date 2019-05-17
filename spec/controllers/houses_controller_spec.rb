require "rails_helper"

RSpec.describe HousesController, type: :controller do
  let(:house) { create(:house) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: house.id}
      expect(response).to have_http_status(:success)
    end
  end
end
