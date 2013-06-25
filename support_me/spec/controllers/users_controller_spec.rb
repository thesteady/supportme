require 'spec_helper'

describe UsersController do
  describe "#create" do
    it "redirects to chats_path when given valid params" do
      post :create, user: {
        name: 'Mr. Goat',
        email: "goat@farm.com",
        password: "goats",
        password_confirmation: "goats"
      }
      expect(response).to be_redirect
      expect(response).to redirect_to root_url
      expect(flash[:notice]).to eq "Your account was created. You can login now."
    end

    it "redirects to root_url when password and password confirmation don't match" do
      post :create, user: {
        name: 'Mr. Goat',
        email: "goat@farm.com",
        password: "goats",
        password_confirmation: "goatsies"
      }
      expect(response).to be_redirect
      expect(response).to redirect_to root_url
      expect(flash[:alert]).to eq "Your account could not be created."
    end

    it "redirects to root_url when email has already been taken" do
      User.create!(
        name: 'Mr. Goat',
        email: "goat@farm.com",
        password: "goatsies",
        password_confirmation: "goatsies"
        )
      post :create, user: {
        name: 'Mr. Goat',
        email: "goat@farm.com",
        password: "goats",
        password_confirmation: "goats"
      }
      expect(response).to be_redirect
      expect(response).to redirect_to root_url
      expect(flash[:alert]).to eq "Your account could not be created."
    end
  end
end
