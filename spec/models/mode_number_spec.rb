require 'rails_helper'

RSpec.describe ModeNumber, type: :model do
  it { should validate_presence_of(:name) }
end
