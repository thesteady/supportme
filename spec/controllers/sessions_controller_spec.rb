require 'spec_helper'

describe SessionsController do
  describe "#create" do
    def create_user
      User.create(
        name: 'Mr. Goat',
        email: "goats@farm.com",
        password: "goats",
        password_confirmation: "goats"
        )
    end

    it "logins a user when given valid params" do
      create_user
      post :create, {
        name: 'Mr. Goat',
        email: "goats@farm.com",
        password: "goats",
      }
      expect(response).to be_redirect
      expect(response).to redirect_to admin_chats_path
      expect(flash[:notice]).to eq "Logged in."
    end

    it "doesn't login a user when a user doesn't exist" do
      post :create, {
        name: 'Mr. Goat',
        email: "goats@farm.com",
        password: "goats",
      }
      expect(response).to be_redirect
      expect(response).to redirect_to root_path
      expect(flash[:alert]).to eq "Email or password was invalid."
    end

    it "doesn't login a user when a password is incorrect" do
      create_user
      post :create, {
        name: 'Mr. Goat',
        email: "goats@farm.com",
        password: "goatsies",
      }
      expect(response).to be_redirect
      expect(response).to redirect_to root_path
      expect(flash[:alert]).to eq "Email or password was invalid."
    end

    it "doesn't login a user when the email is incorrect" do
      create_user
      post :create, {
        name: 'Mr. Goat',
        email: "goatsies@farm.com",
        password: "goats",
      }
      expect(response).to be_redirect
      expect(response).to redirect_to root_path
      expect(flash[:alert]).to eq "Email or password was invalid."
    end
  end

  describe "#destroy" do
    it "logouts a user" do
      delete :destroy
      expect(response).to be_redirect
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eq "Logged out."
    end
  end
end
