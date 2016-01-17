require "rails_helper"

RSpec.describe Item, type: :model do
  let(:auctionet_response) do
    {
      "id" => 42,
      "title" => "The Answer to the Ultimate Question of Life, The Universe, and Everything.",
      "url" => "https://auctionet.com/en/42-the-answer"
    }
  end

  describe ".all" do
    it "returns array from Auctionet API" do
      expect(Auctionet).to receive(:fetch).
        with("items", params: {}).
        and_return({ "items" => [] })

      result = Item.all(cached: false)

      expect(result).to be_an(Array)
      expect(result.count).to be_zero
    end

    it "returns array of Items fetched from Auctionet API" do
      expect(Auctionet).to receive(:fetch).
        with("items", params: {}).
        and_return({ "items" => [auctionet_response] })

      result = Item.all(cached: false).first

      expect(result).to be_an(Item)
      expect(result.id).to eq auctionet_response["id"]
      expect(result.title).to eq auctionet_response["title"]
      expect(result.url).to eq auctionet_response["url"]
    end
  end

  describe ".find" do
    it "returns Item fetched from Auctionet API by ID" do
      expect(Auctionet).to receive(:fetch).
        with("items", id: 42, params: {}).
        and_return({ "item" => auctionet_response })

      result = Item.find(42, cached: false)

      expect(result).to be_an(Item)
      expect(result.id).to eq auctionet_response["id"]
      expect(result.title).to eq auctionet_response["title"]
      expect(result.url).to eq auctionet_response["url"]
    end
  end
end
