require "rails_helper"

RSpec.describe Category, type: :model do
  let(:auctionet_response) do
    {
      "id" => 42,
      "name" => "Art"
    }
  end

  describe ".all" do
    it "returns array from Auctionet API" do
      expect(Auctionet).to receive(:fetch).
        with("categories", params: {}).
        and_return({ "categories" => [] })

      result = Category.all

      expect(result).to be_an(Array)
      expect(result.count).to be_zero
    end

    it "returns array of Categories fetched from Auctionet API" do
      expect(Auctionet).to receive(:fetch).
        with("categories", params: {}).
        and_return({ "categories" => [auctionet_response] })

      result = Category.all.first

      expect(result).to be_an(Category)
      expect(result.id).to eq auctionet_response["id"]
      expect(result.name).to eq auctionet_response["name"]
    end
  end

  describe ".find" do
    it "returns Category fetched from Auctionet API by ID" do
      expect(Auctionet).to receive(:fetch).
        with("categories", id: 42, params: {}).
        and_return({ "category" => auctionet_response })

      result = Category.find(42)

      expect(result).to be_an(Category)
      expect(result.id).to eq auctionet_response["id"]
      expect(result.name).to eq auctionet_response["name"]
    end
  end
end
