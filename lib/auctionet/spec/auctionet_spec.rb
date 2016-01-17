require "spec_helper"

describe Auctionet do
  describe ".fetch" do
    it "returns JSON response for items list" do
      stub_request(:get, "https://auctionet.com/api/v2/items.json").
        to_return(status: 200, body: "{\"items\":[{\"id\":42}]}", headers: {})

      expect(Auctionet.fetch("items")).to eq("items" => [{ "id" => 42 }])
    end

    it "returns JSON response for single item" do
      stub_request(:get, "https://auctionet.com/api/v2/items/42.json").
        to_return(status: 200, body: "{\"item\":{\"id\":42}}", headers: {})

      expect(Auctionet.fetch("items", id: 42)).to eq("item" => { "id" => 42 })
    end

    it "raises error if something went wrong" do
      stub_request(:get, "https://auctionet.com/api/v2/non-existent.json").
        to_return(status: 500, body: "", headers: {})

      expect{ Auctionet.fetch("non-existent") }.to raise_error(Auctionet::InternalServerError)
    end
  end
end
