require 'rails_helper'

RSpec.describe ContainerRepairArea, type: :model do
  it { should validate_presence_of(:name) }
end
