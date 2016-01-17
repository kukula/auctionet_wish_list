require 'rails_helper'
RSpec.describe WishedItemsController, type: :controller do
  let(:valid_attributes) { { external_id: 42 } }
  let(:invalid_attributes) { { lol: :wut } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all wished_items as @wished_items" do
      wished_item = WishedItem.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:wished_items)).to eq([wished_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested wished_item as @wished_item" do
      wished_item = WishedItem.create! valid_attributes
      get :show, params: { id: wished_item.to_param }, sessaion: valid_session
      expect(assigns(:wished_item)).to eq(wished_item)
    end
  end

  describe "POST #create" do
    it "creates a new WishedItem" do
      expect {
        post :create, params: { wished_item: valid_attributes }, sessaion: valid_session
      }.to change(WishedItem, :count).by(1)
    end

    it "assigns a newly created wished_item as @wished_item" do
      post :create, params: { wished_item: valid_attributes }, sessaion: valid_session
      expect(assigns(:wished_item)).to be_a(WishedItem)
      expect(assigns(:wished_item)).to be_persisted
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested wished_item" do
      wished_item = WishedItem.create! valid_attributes
      expect {
        delete :destroy, params: { id: wished_item.to_param }, sessaion: valid_session
      }.to change(WishedItem, :count).by(-1)
    end
  end
end
