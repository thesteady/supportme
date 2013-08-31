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
      VCR.use_cassette('creating_a_customer') do
        count = Customer.count

        post :create, customer: {
          name: "Mr. Goat",
          email: "example@example.com"
        }

        expect(response).to be_redirect
        result = Customer.count
        expect(result).to eq (count + 1)
      end
    end

    it "finds a customer when it already exists" do
      Customer.create(name: "Mr. Goat", email: "example@example.com")
      
      VCR.use_cassette('creating_a_customer') do

        expect{
          post :create, customer: {
            name: "Mr. Goat",
            email: "example@example.com"
          }
        }.to change(Customer, :count).by(0)

        expect(response).to be_redirect
      end
    end

    it "redirects to the new_customer path when the email is missing" do
      expect{
        post :create, customer: {
          name: "Mr. Goat"
        }
      }.to change(Customer, :count).by(0)

      expect(response).to be_redirect
      expect(response).to redirect_to new_customer_path
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
