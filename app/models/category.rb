class Category < Struct.new(*%i(id name parent_id children))
  def self.all(options: {})
    json = Auctionet.fetch("categories", params: options)
    json["categories"].map { |item| from_hash(item) }
  end

  def self.find(id, options: {})
    json = Auctionet.fetch("categories", id: id, params: options)
    from_hash json["category"]
  end

  def self.from_hash(hash)
    new *hash.values_at(*fields)
  end

  def self.fields
    members.map(&:to_s)
  end
end
