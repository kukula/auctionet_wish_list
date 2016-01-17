module Auctionet
  class Client
    def initialize(resource, id: nil, params: {})
      @resource, @id, @params = resource, id, params
    end

    def fetch
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    private

    attr_reader :resource, :id, :params

    def handle_response(res)
      if res.is_a?(Net::HTTPSuccess)
        JSON.parse res.body
      else
        raise InternalServerError
      end
    end

    def uri
      @uri ||= URI(web_address)
      @uri.query = URI.encode_www_form(params) unless params.empty?
      @uri
    end

    def web_address
      requested = [resource, id].compact.join('/')
      "https://auctionet.com/api/v2/#{requested}.json"
    end
  end
end
