require 'rails_helper'

RSpec.describe Dam, type: :model do
  it { should validate_presence_of(:name) }
end
