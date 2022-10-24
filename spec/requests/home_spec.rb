require 'rails_helper'

RSpec.describe "Homes", type: :request do

  let(:user) { create(:user) }

  describe "GET /index" do
    it "redirect_to root" do
      login_as(user)
      get "/"
      expect(response).to have_http_status(200)
      expect(response.body).to include("Home")
    end
  end

end
