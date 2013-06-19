require 'spec_helper'

describe DemoController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_redirect
    end
  end

end
