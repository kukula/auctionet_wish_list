require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET index" do
    it "returns http success" do
      expect(Item).to receive(:all).
        with(options: { state: "published" }).
        and_return([Item.new])
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      expect(Item).to receive(:find).
        with("42").
        and_return(Item.new)
      get :show, params: { id: 42 }

      expect(response).to have_http_status(:success)
    end
  end
end
