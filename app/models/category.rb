class Category < Struct.new(*%i(id name parent_id children))
  CACHE_PERIOD = 5.minutes

  def self.all(options: {}, cached: true)
    Rails.cache.fetch(:categories, force: !cached, expires_in: CACHE_PERIOD) do
      json = Auctionet.fetch("categories", params: options)
      json["categories"].map { |item| from_hash(item) }
    end
  end

  def self.find(id, options: {}, cached: true)
    Rails.cache.fetch([:categories, id], force: !cached, expires_in: CACHE_PERIOD) do
      json = Auctionet.fetch("categories", id: id, params: options)
      from_hash json["category"]
    end
  end

  def self.from_hash(hash)
    new *hash.values_at(*fields)
  end

  def self.fields
    members.map(&:to_s)
  end
end
