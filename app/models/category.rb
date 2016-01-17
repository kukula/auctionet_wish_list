class Category < Struct.new(*%i(id name parent_id children))
  include ApiModel
end
