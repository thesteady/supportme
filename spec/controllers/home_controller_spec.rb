require 'spec_helper'

describe HomeController do
  describe "#show" do
    it "renders show when there is no current user exist" do
      get :show
      expect(response).to be_ok
      expect(response).to render_template(:show)
    end

    it "redirects to chats_path when a current user exists" do
      user = User.create(
        email: "goats@farm.com",
        password: "goats",
        password_confirmation: "goats"
        )
      controller.stub!(:current_user).and_return(user)
      get :show
      expect(response).to be_redirect
      expect(response).to redirect_to chats_path
    end
  end
end