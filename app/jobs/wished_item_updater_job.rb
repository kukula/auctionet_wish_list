class WishedItemUpdaterJob < ApplicationJob
  queue_as :default

  def perform(wished_item_id)
    wished_item = WishedItem.find(wished_item_id)
    item = Item.find(wished_item.external_id)

    wished_item.update({
      title: item.title,
      state: item.state,
      description: item.description,
      next_bid: item.next_bid_amount,
      bids_count: item.bids.count
    })
  end
end
