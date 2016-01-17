require 'rails_helper'

RSpec.describe WishedItem, type: :model do
  it { is_expected.to validate_presence_of(:external_id) }
  it { is_expected.to validate_uniqueness_of(:external_id) }
end
