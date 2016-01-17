require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET index" do
    it "returns http success" do
      expect(Category).to receive(:all).
        and_return([Category.new])
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
