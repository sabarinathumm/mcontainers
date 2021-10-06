require 'rails_helper'

RSpec.describe Container, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:yard) }
  it { should belong_to(:container_type) }

  it { should have_many(:container_attachments)}
  it { should validate_uniqueness_of(:container_uid)}
end
