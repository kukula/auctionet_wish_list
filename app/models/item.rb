class Item < Struct.new(*%i(id title state url images
                            description currency estimate
                            next_bid_amount bids))

  include ApiModel
end
