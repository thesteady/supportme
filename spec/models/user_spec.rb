require 'spec_helper'

describe User do
  let(:user) {User.new(
                        name: 'Mr. Goat',
                        email: 'goat@farm.com',
                        password: 'goats',
                        password_confirmation: 'goats'
                      )}

  context "when given incorrect parameters" do
    it "doesn't create a user when the password is not present" do
      user.password = nil
      expect(user).not_to be_valid
    end

    it "doesn't create a user when the email is not present" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "doesn't create a user when passwords don't match" do
      user.password = 'notagoat'
      expect(user).not_to be_valid
    end

    it "doesn't create a user when the email is invalid" do
      user.email = "farm.com"
      expect(user).not_to be_valid
    end

    it "doesn't create a user when email already exists" do
      user.save
      duplicate_user = User.new( name: 'Mr. Goat',
                                 email: 'goat@farm.com',
                                 password: 'goats',
                                 password_confirmation: 'goats')
      expect(duplicate_user).not_to be_valid
    end
  end

  context "when given correct parameters" do
    it "creates a user" do
      expect(user).to be_valid
      expect(user.email).to eq "goat@farm.com"
      expect(user.name).to eq 'Mr. Goat'
    end
  end
end
