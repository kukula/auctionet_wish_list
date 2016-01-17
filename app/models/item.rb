class Item < Struct.new(*%i(id title state url images
                            description currency estimate
                            next_bid_amount bids))

  def self.all(options: {})
    json = Auctionet.fetch("items", params: options)
    json["items"].map { |item| from_hash(item) }
  end

  def self.find(id, options: {})
    json = Auctionet.fetch("items", id: id, params: options)
    from_hash json["item"]
  end

  def self.from_hash(hash)
    new *hash.values_at(*fields)
  end

  def self.fields
    members.map(&:to_s)
  end
end
