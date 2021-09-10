require 'rails_helper'

RSpec.describe ContainerDamagedArea, type: :model do
  it { should validate_presence_of(:name) }
end
