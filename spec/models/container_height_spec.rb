require 'rails_helper'

RSpec.describe ContainerHeight, type: :model do
  it { should validate_presence_of(:name) }
end
