require 'rails_helper'

RSpec.describe RepairType, type: :model do
  it { should validate_presence_of(:name) }
end
