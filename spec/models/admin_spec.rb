require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "Validations" do

  	let!(:admin) { Admin.new(first_name: 'Mitchell', last_name: 'Rodruigez', password: 'Password@123', \
                  email: 'mitchellr@email.com', phone_number: '+91 9090902020') }

  	context "success" do
  		it "is valid with valid attributes" do
		    expect(admin).to be_valid
		  end
  	end

  	it "email should be unique error" do
      create(:admin, email: 'mitchellr@email.com')
	    expect(admin).not_to be_valid
		end

	  it "email format error" do
			admin.email = "example"
	    expect(admin).not_to be_valid
	  end

	  it "password should be present error" do
			admin.password = nil
	    expect(admin).not_to be_valid
	  end

	  it "password format error" do
			admin.password = "password"
	    expect(admin).not_to be_valid
	  end

	  it "first_name should be present error" do
			admin.first_name = nil
	    expect(admin).not_to be_valid
	  end

	  it "last_name should be present error" do
			admin.last_name = nil
	    expect(admin).not_to be_valid
	  end

	  it "phone_number should be present error" do
			admin.phone_number = nil
	    expect(admin).not_to be_valid
		end

		it "phone_number should be unique error" do
      create(:admin, phone_number: admin.phone_number)
	    expect(admin).not_to be_valid
		end
  end
end
