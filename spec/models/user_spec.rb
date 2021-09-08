require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

  	let!(:user) { User.new( first_name:  "first name", last_name: "last name", email: "example@mail.com", password: "Password@123", phone_number: "+1234567890") }

  	context "success" do
  		it "is valid with valid attributes" do
		    expect(user).to be_valid
		  end
  	end

  	it "email should be unique error" do
			create(:user, email: "example@mail.com")
	    expect(user).not_to be_valid
		end

	  it "email format error" do
			user.email = "example"
	    expect(user).not_to be_valid
	  end

	  it "password should be present error" do
			user.password = nil
	    expect(user).not_to be_valid
	  end

	  it "password format error" do
			user.password = "password"
	    expect(user).not_to be_valid
	  end

	  it "first_name should be present error" do
			user.first_name = nil
	    expect(user).not_to be_valid
	  end

	  it "last_name should be present error" do
			user.last_name = nil
	    expect(user).not_to be_valid
	  end

	  it "phone_number should be present error" do
			user.phone_number = nil
	    expect(user).not_to be_valid
		end

		it "phone_number should be unique error" do
			create(:user, phone_number: "+1234567890")
	    expect(user).not_to be_valid
		end
  end
end
