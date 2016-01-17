class Item < Struct.new(*%i(id title state url images
                            description currency estimate
                            next_bid_amount bids))
  CACHE_PERIOD = 5.minutes

  def self.all(options: {}, cached: true)
    Rails.cache.fetch(:items, force: !cached, expires_in: CACHE_PERIOD) do
      json = Auctionet.fetch("items", params: options)
      json["items"].map { |item| from_hash(item) }
    end
  end

  def self.find(id, options: {}, cached: true)
    Rails.cache.fetch([:item, id], force: !cached, expires_in: CACHE_PERIOD) do
      json = Auctionet.fetch("items", id: id, params: options)
      from_hash json["item"]
    end
  end

  def self.from_hash(hash)
    new *hash.values_at(*fields)
  end

  def self.fields
    members.map(&:to_s)
  end
end
