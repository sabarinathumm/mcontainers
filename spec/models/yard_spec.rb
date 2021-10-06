require 'rails_helper'

RSpec.describe Yard, type: :model do
  it { should validate_presence_of(:name) }
end
