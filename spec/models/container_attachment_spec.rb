require 'rails_helper'

RSpec.describe ContainerAttachment, type: :model do
  it { should validate_presence_of(:attachment) }
end
