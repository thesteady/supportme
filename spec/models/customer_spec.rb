require 'spec_helper'

describe Customer do
  context "when given incorrect parameters" do
    it "doesn't create a user when the email is not present" do
      result = Customer.create(
        name: "Mr. Goat"
        )
      expect(result).not_to be_valid
    end

    it "doesn't create a user when the name is not present" do
      result = Customer.create(
        email: "goat@farm.com"
        )
      expect(result).not_to be_valid
    end
  end

  context "when given correct parameters" do
    it "creates a user" do
      result = Customer.create(
        name: "Mr. Goat",
        email: "goat@farm.com"
        )
      expect(result).to be_valid
      expect(result.name).to eq "Mr. Goat"
      expect(result.email).to eq "goat@farm.com"
    end
  end
end