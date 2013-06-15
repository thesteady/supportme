require 'spec_helper'

describe User do
  context "when given incorrect parameters" do
    it "doesn't create a user when the password is not present" do
      result = User.create(
        email: "goat@farm.com"
        )
      expect(result).not_to be_valid
    end

    it "doesn't create a user when the email is not present" do
      result = User.create(
        password: "goats",
        password_confirmation: "goats"
        )
      expect(result).not_to be_valid
    end

    it "doesn't create a user when passwords don't match" do
      result = User.create(
        email: "goat@farm.com",
        password: "goats",
        password_confirmation: "goatsies"
        )
      expect(result).not_to be_valid
    end

    it "doesn't create a user when email already exists" do
      User.create(
        email: "goat@farm.com",
        password: "goats",
        password_confirmation: "goats"
        )
      result = User.create(
        email: "goat@farm.com",
        password: "goatsies",
        password_confirmation: "goatsies"
        )
      expect(result).not_to be_valid
    end
  end

  context "when given correct parameters" do
    it "creates a user" do
      result = User.create(
        email: "goat@farm.com",
        password: "goats",
        password_confirmation: "goats"
        )
      expect(result).to be_valid
      expect(result.email).to eq "goat@farm.com"
    end
  end
end