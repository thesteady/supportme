require 'spec_helper'

describe CustomersController do
  describe "#new" do
    it "renders the new view" do
      get :new
      expect(response).to be_ok
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "creates a new customer when it doesn't exist" do
      count = Customer.count

      post :create, customer: {
        name: "Mr. Goat",
        email: "example@example.com"
      }

      expect(response).to be_redirect
      expect(response).to redirect_to admin_chat_path(Chat.first)

      result = Customer.count
      expect(result).to eq (count + 1)
    end

    it "finds a customer when it already exists" do
      Customer.create(
        name: "Mr. Goar",
        email: "example@example.com"
        )

      count = Customer.count

      post :create, customer: {
        name: "Mr. Goat",
        email: "example@example.com"
      }

      expect(response).to be_redirect
      expect(response).to redirect_to admin_chat_path(Chat.first)

      result = Customer.count
      expect(result).to eq (count)
    end

    it "redirects to the new_customer path when the email is missing" do
      count = Customer.count

      post :create, customer: {
        name: "Mr. Goat"
      }

      result = Customer.count

      expect(response).to be_redirect
      expect(response).to redirect_to new_customer_path
      expect(result).to eq (count)
    end

    it "redirects to the new_customer path when the name is missing" do
      count = Customer.count

      post :create, customer: {
        email: "example@example.com"
      }

      result = Customer.count

      expect(response).to be_redirect
      expect(response).to redirect_to new_customer_path
      expect(result).to eq (count)
    end
  end
end
