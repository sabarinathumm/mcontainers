require 'rails_helper'

RSpec.describe ContainerAttachment, type: :model do
  it { should belong_to(:attachment) }
end
