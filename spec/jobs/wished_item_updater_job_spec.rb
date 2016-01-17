require 'rails_helper'

RSpec.describe WishedItemUpdaterJob, type: :job do
  let(:auctionet_response) do
    {
      "id" => 42,
      "title" => "The Answer to the Ultimate Question of Life, The Universe, and Everything.",
      "url" => "https://auctionet.com/en/42-the-answer",
      "bids" => []
    }
  end

  it "update saved item in wish list with data from API" do
    wished_item = WishedItem.create!(external_id: 42)
    expect(Item).to receive(:find).
      with("42").
      and_return(Item.from_hash(auctionet_response))

    expect { WishedItemUpdaterJob.new.perform(wished_item.id) }.to \
      change { wished_item.reload.title }.
      from(nil).to(auctionet_response["title"])
  end
end
