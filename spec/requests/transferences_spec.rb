require 'rails_helper'

RSpec.describe "Transferences", type: :request do

  describe "POST /transferences" do

    it "should create a new transaction" do
      post "/transferences"
      expect(response).to have_http_status(302)
    end
    
  end

end
