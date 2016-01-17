module ApiModel
  module ClassMethods
    def all(options: {})
      json = Auctionet.fetch(type, params: options)
      json[type].map { |item| from_hash(item) }
    end

    def find(id, options: {})
      json = Auctionet.fetch(type, id: id, params: options)
      from_hash json[name.downcase]
    end

    def from_hash(hash)
      new *hash.values_at(*fields)
    end

    def fields
      members.map(&:to_s)
    end

    def type
      name.downcase.pluralize
    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
  end
end
