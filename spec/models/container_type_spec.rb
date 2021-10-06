require 'rails_helper'

RSpec.describe ContainerType, type: :model do
  it { should validate_presence_of(:name) }
end
