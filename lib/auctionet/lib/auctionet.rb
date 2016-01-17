require "uri"
require "net/http"
require "json"

require "auctionet/version"
require "auctionet/client"

module Auctionet
  class InternalServerError < RuntimeError; end

  def self.fetch(resource, id: nil, params: {})
    Client.new(resource, id: id, params: params).fetch
  end
end
