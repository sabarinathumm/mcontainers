require 'rails_helper'

RSpec.describe Comp, type: :model do
  it { should validate_presence_of(:name) }
end
